/*
Copyright (c) 2006, BANQPAY! Inc. All rights reserved.
Code licensed under the BSD License:
http://developer.BANQPAY.net/yui/license.txt
version: 0.10.0
*/
/**
* @class 
* Config is a utility used within an object to allow the implementer to maintain a list of local configuration properties and listen for changes to those properties dynamically using CustomEvent. The initial values are also maintained so that the configuration can be reset at any given point to its initial state.
* @param {object}	owner	The owner object to which this Config object belongs
* @constructor
*/
BANQPAY.util.Config = function(owner) {
	if (owner) {
		this.init(owner);
	}
}

BANQPAY.util.Config.prototype = {
	
	/**
	* Object reference to the owner of this Config object
	* @type object
	*/
	owner : null,

	/**
	* Object reference to the owner of this Config object
	* args: key, value
	* @type BANQPAY.util.CustomEvent
	*/
	configChangedEvent : null,

	/**
	* Boolean flag that specifies whether a queue is currently being executed
	* @type boolean
	*/
	queueInProgress : false,

	/**
	* Adds a property to the Config object's private config hash. 
	* @param {string}	key	The configuration property's name
	* @param {object}	propertyObject	The object containing all of this property's arguments
	*/
	addProperty : function(key, propertyObject){},

	/**
	* Returns a key-value configuration map of the values currently set in the Config object.
	* @return {object} The current config, represented in a key-value map
	*/
	getConfig : function(){},

	/**
	* Returns the value of specified property.
	* @param {key}		The name of the property
	* @return {object}	The value of the specified property
	*/
	getProperty : function(key){},

	/**
	* Resets the specified property's value to its initial value.
	* @param {key}		The name of the property
	*/
	resetProperty : function(key){},

	/**
	* Sets the value of a property. If the silent property is passed as true, the property's event will not be fired.
	* @param {key}		The name of the property
	* @param {value}	The value to set the property to
	* @param {boolean}	Whether the value should be set silently, without firing the property event.
	* @return {boolean}	true, if the set was successful, false if it failed.
	*/
	setProperty : function(key,value,silent){},

	/**
	* Sets the value of a property and queues its event to execute. If the event is already scheduled to execute, it is
	* moved from its current position to the end of the queue.
	* @param {key}		The name of the property
	* @param {value}	The value to set the property to
	* @return {boolean}	true, if the set was successful, false if it failed.
	*/	
	queueProperty : function(key,value){},

	/**
	* Fires the event for a property using the property's current value.
	* @param {key}		The name of the property
	*/
	refireEvent : function(key){},

	/**
	* Applies a key-value object literal to the configuration, replacing any existing values, and queueing the property events.
	* Although the values will be set, fireQueue() must be called for their associated events to execute.
	* @param {object}	userConfig	The configuration object literal
	* @param {boolean}	init		When set to true, the initialConfig will be set to the userConfig passed in, so that calling a reset will reset the properties to the passed values.
	*/
	applyConfig : function(userConfig,init){},

	/**
	* Refires the events for all configuration properties using their current values.
	*/
	refresh : function(){},

	/**
	* Fires the normalized list of queued property change events
	*/
	fireQueue : function(){},

	/**
	* Subscribes an external handler to the change event for any given property. 
	* @param {string}	key			The property name
	* @param {Function}	handler		The handler function to use subscribe to the property's event
	* @param {object}	obj			The object to use for scoping the event handler (see CustomEvent documentation)
	* @param {boolean}	override	Optional. If true, will override "this" within the handler to map to the scope object passed into the method.
	*/	
	subscribeToConfigEvent : function(key,handler,obj,override){},

	/**
	* Unsubscribes an external handler from the change event for any given property. 
	* @param {string}	key			The property name
	* @param {Function}	handler		The handler function to use subscribe to the property's event
	* @param {object}	obj			The object to use for scoping the event handler (see CustomEvent documentation)
	*/
	unsubscribeFromConfigEvent: function(key,handler,obj){},

	/**
	* Validates that the value passed in is a boolean.
	* @param	{object}	val	The value to validate
	* @return	{boolean}	true, if the value is valid
	*/	
	checkBoolean: function(val) {
		if (typeof val == 'boolean') {
			return true;
		} else {
			return false;
		}
	},

	/**
	* Validates that the value passed in is a number.
	* @param	{object}	val	The value to validate
	* @return	{boolean}	true, if the value is valid
	*/
	checkNumber: function(val) {
		if (isNaN(val)) {
			return false;
		} else {
			return true;
		}
	}
}


/**
* Initializes the configuration object and all of its local members.
* @param {object}	owner	The owner object to which this Config object belongs
*/
BANQPAY.util.Config.prototype.init = function(owner) {

	this.owner = owner;
	this.configChangedEvent = new BANQPAY.util.CustomEvent("configChanged");
	this.queueInProgress = false;

	/* Private Members */

	var config = {};
	var initialConfig = {};
	var eventQueue = [];

	/**
	* @private
	* Fires a configuration property event using the specified value. 
	* @param {string}	key			The configuration property's name
	* @param {value}	object		The value of the correct type for the property
	*/ 
	var fireEvent = function( key, value ) {
		key = key.toLowerCase();

		var property = config[key];

		if (typeof property != 'undefined' && property.event) {
			property.event.fire(value);
		}	
	}
	/* End Private Members */

	this.addProperty = function( key, propertyObject ) {
		key = key.toLowerCase();

		config[key] = propertyObject;

		propertyObject.event = new BANQPAY.util.CustomEvent(key);
		propertyObject.key = key;

		if (propertyObject.handler) {
			propertyObject.event.subscribe(propertyObject.handler, this.owner, true);
		}

		this.setProperty(key, propertyObject.value, true);
		
		if (! propertyObject.suppressEvent) {
			this.queueProperty(key, propertyObject.value);
		}
	}

	this.getConfig = function() {
		var cfg = {};
			
		for (var prop in config) {
			var property = config[prop]
			if (typeof property != 'undefined' && property.event) {
				cfg[prop] = property.value;
			}
		}
		
		return cfg;
	}

	this.getProperty = function(key) {
		key = key.toLowerCase();

		var property = config[key];
		if (typeof property != 'undefined' && property.event) {
			return property.value;
		} else {
			return undefined;
		}
	}


	this.resetProperty = function(key) {
		key = key.toLowerCase();

		var property = config[key];
		if (typeof property != 'undefined' && property.event) {
			this.setProperty(key, initialConfig[key].value);
		} else {
			return undefined;
		}
	}


	this.setProperty = function(key, value, silent) {
		key = key.toLowerCase();

		if (this.queueInProgress && ! silent) {
			this.queueProperty(key,value); // Currently running through a queue... 
			return true;
		} else {
			var property = config[key];
			if (typeof property != 'undefined' && property.event) {
				if (property.validator && ! property.validator(value)) { // validator
					return false;
				} else {
					property.value = value;
					if (! silent) {
						fireEvent(key, value);
						this.configChangedEvent.fire([key, value]);
					}
					return true;
				}
			} else {
				return false;
			}
		}
	}

	this.queueProperty = function(key, value) {
		key = key.toLowerCase();

		var property = config[key];
							
		if (typeof property != 'undefined' && property.event) {
			if (typeof value != 'undefined' && property.validator && ! property.validator(value)) { // validator
				return false;
			} else {

				if (typeof value != 'undefined') {
					property.value = value;
				} else {
					value = property.value;
				}

				var foundDuplicate = false;

				for (var i=0;i<eventQueue.length;i++) {
					var queueItem = eventQueue[i];

					if (queueItem) {
						var queueItemKey = queueItem[0];
						var queueItemValue = queueItem[1];
						
						if (queueItemKey.toLowerCase() == key) {
							// found a dupe... push to end of queue, null current item, and break
							eventQueue[i] = null;
							eventQueue.push([key, (typeof value != 'undefined' ? value : queueItemValue)]);
							foundDuplicate = true;
							break;
						}
					}
				}
				
				if (! foundDuplicate && typeof value != 'undefined') { // this is a refire, or a new property in the queue
					eventQueue.push([key, value]);
				}
			}

			if (property.supercedes) {
				for (var s=0;s<property.supercedes.length;s++) {
					var supercedesCheck = property.supercedes[s];

					for (var q=0;q<eventQueue.length;q++) {
						var queueItemCheck = eventQueue[q];

						if (queueItemCheck) {
							var queueItemCheckKey = queueItemCheck[0];
							var queueItemCheckValue = queueItemCheck[1];
							
							if ( queueItemCheckKey.toLowerCase() == supercedesCheck.toLowerCase() ) {
								eventQueue.push([queueItemCheckKey, queueItemCheckValue]);
								eventQueue[q] = null;
								break;
							}
						}
					}
				}
			}

			return true;
		} else {
			return false;
		}
	}

	this.refireEvent = function(key) {
		key = key.toLowerCase();

		var property = config[key];
		if (typeof property != 'undefined' && property.event && typeof property.value != 'undefined') {
			if (this.queueInProgress) {
				this.queueProperty(key);
			} else {
				fireEvent(key, property.value);
			}
		}
	}

	this.applyConfig = function(userConfig, init) {
		if (init) {
			initialConfig = userConfig;
		}
		for (var prop in userConfig) {
			this.queueProperty(prop, userConfig[prop]);
		}
	}

	this.refresh = function() {
		for (var prop in config) {
			this.refireEvent(prop);
		}
	}

	this.fireQueue = function() {
		this.queueInProgress = true;
		for (var i=0;i<eventQueue.length;i++) {
			var queueItem = eventQueue[i];
			if (queueItem) {
				var key = queueItem[0];
				var value = queueItem[1];
				
				var property = config[key];
				property.value = value;

				fireEvent(key,value);
			}
		}
		
		this.queueInProgress = false;
		eventQueue = new Array();
	}

	this.subscribeToConfigEvent = function(key, handler, obj, override) {
		key = key.toLowerCase();

		var property = config[key];
		if (typeof property != 'undefined' && property.event) {
			if (! BANQPAY.util.Config.alreadySubscribed(property.event, handler, obj)) {
				property.event.subscribe(handler, obj, override);
			}
			return true;
		} else {
			return false;
		}
	}


	this.unsubscribeFromConfigEvent = function(key, handler, obj) {
		key = key.toLowerCase();

		var property = config[key];
		if (typeof property != 'undefined' && property.event) {
			return property.event.unsubscribe(handler, obj);
		} else {
			return false;
		}
	}

	// TODO: REMOVE
	this.outputEventQueue = function() {
		var output = "";
		for (var q=0;q<eventQueue.length;q++) {
			var queueItem = eventQueue[q];
			if (queueItem) {
				output += queueItem[0] + "=" + queueItem[1] + ", ";
			}
		}
		return output;
	}
}

/**
* Checks to determine if a particular function/object pair are already subscribed to the specified CustomEvent
* @param {BANQPAY.util.CustomEvent} evt	The CustomEvent for which to check the subscriptions
* @param {Function}	fn	The function to look for in the subscribers list
* @param {object}	obj	The execution scope object for the subscription
* @return {boolean}	true, if the function/object pair is already subscribed to the CustomEvent passed in
*/
BANQPAY.util.Config.alreadySubscribed = function(evt, fn, obj) {
	for (var e=0;e<evt.subscribers.length;e++) {
		var subsc = evt.subscribers[e];
		if (subsc && subsc.obj == obj && subsc.fn == fn) {
			return true;
			break;
		}
	}
	return false;
}/**
Copyright (c) 2006, BANQPAY! Inc. All rights reserved.
Code licensed under the BSD License:
http://developer.BANQPAY.net/yui/license.txt
* @class 
* Module is a JavaScript representation of the Standard Module Format. Standard Module Format is a simple standard for markup containers where child nodes representing the header, body, and footer of the content are denoted using the CSS classes "hd", "bd", and "ft" respectively. Module is the base class for all other classes in the YUI Container package.
* @param {string}	el	The element ID representing the Module <em>OR</em>
* @param {Element}	el	The element representing the Module
* @param {object}	userConfig	The configuration object literal containing the configuration that should be set for this module. See configuration documentation for more details.
* @constructor
*/
BANQPAY.widget.Module = function(el, userConfig) {
	if (el) { 
		this.init(el, userConfig); 
	}
}

/**
* Constant representing the prefix path to use for non-secure images
* @type string
*/
BANQPAY.widget.Module.IMG_ROOT = "http://us.i1.yimg.com/us.yimg.com/i/";

/**
* Constant representing the prefix path to use for securely served images
* @type string
*/
BANQPAY.widget.Module.IMG_ROOT_SSL = "https://a248.e.akamai.net/sec.yimg.com/i/";

/**
* Constant for the default CSS class name that represents a Module
* @type string
* @final
*/
BANQPAY.widget.Module.CSS_MODULE = "module";

/**
* Constant representing the module header
* @type string
* @final
*/
BANQPAY.widget.Module.CSS_HEADER = "hd";

/**
* Constant representing the module body
* @type string
* @final
*/
BANQPAY.widget.Module.CSS_BODY   = "bd";

/**
* Constant representing the module footer
* @type string
* @final
*/
BANQPAY.widget.Module.CSS_FOOTER = "ft";

BANQPAY.widget.Module.prototype = {

	/**
	* The class's constructor function
	* @type function
	*/
	constructor : BANQPAY.widget.Module,

	/**
	* The main module element that contains the header, body, and footer
	* @type Element
	*/
	element : null, 

	/**
	* The header element, denoted with CSS class "hd"
	* @type Element
	*/
	header : null,

	/**
	* The body element, denoted with CSS class "bd"
	* @type Element
	*/
	body : null,

	/**
	* The footer element, denoted with CSS class "ft"
	* @type Element
	*/
	footer : null,

	/**
	* The id of the element
	* @type string
	*/
	id : null,

	/**
	* Array of elements
	* @type Element[]
	*/
	childNodesInDOM : null,

	/**
	* The string representing the image root
	* @type string
	*/
	imageRoot : BANQPAY.widget.Module.IMG_ROOT,

	/**
	* CustomEvent fired prior to class initalization.
	* args: class reference of the initializing class, such as this.beforeInitEvent.fire(BANQPAY.widget.Module)
	* @type BANQPAY.util.CustomEvent
	*/
	beforeInitEvent : null,

	/**
	* CustomEvent fired after class initalization.
	* args: class reference of the initializing class, such as this.initEvent.fire(BANQPAY.widget.Module)
	* @type BANQPAY.util.CustomEvent
	*/
	initEvent : null,

	/**
	* CustomEvent fired when the Module is appended to the DOM
	* args: none
	* @type BANQPAY.util.CustomEvent
	*/
	appendEvent : null,

	/**
	* CustomEvent fired before the Module is rendered
	* args: none
	* @type BANQPAY.util.CustomEvent
	*/
	beforeRenderEvent : null,

	/**
	* CustomEvent fired after the Module is rendered
	* args: none
	* @type BANQPAY.util.CustomEvent
	*/
	renderEvent : null,

	/**
	* CustomEvent fired when the header content of the Module is modified
	* args: string/element representing the new header content
	* @type BANQPAY.util.CustomEvent
	*/
	changeHeaderEvent : null,

	/**
	* CustomEvent fired when the body content of the Module is modified
	* args: string/element representing the new body content
	* @type BANQPAY.util.CustomEvent
	*/
	changeBodyEvent : null,

	/**
	* CustomEvent fired when the footer content of the Module is modified
	* args: string/element representing the new footer content
	* @type BANQPAY.util.CustomEvent
	*/
	changeFooterEvent : null,

	/**
	* CustomEvent fired when the content of the Module is modified
	* args: none
	* @type BANQPAY.util.CustomEvent
	*/
	changeContentEvent : null,

	/**
	* CustomEvent fired when the Module is destroyed
	* args: none
	* @type BANQPAY.util.CustomEvent
	*/
	destroyEvent : null,

	/**
	* CustomEvent fired before the Module is shown
	* args: none
	* @type BANQPAY.util.CustomEvent
	*/
	beforeShowEvent : null,

	/**
	* CustomEvent fired after the Module is shown
	* args: none
	* @type BANQPAY.util.CustomEvent
	*/
	showEvent : null,

	/**
	* CustomEvent fired before the Module is hidden
	* args: none
	* @type BANQPAY.util.CustomEvent
	*/
	beforeHideEvent : null,
	
	/**
	* CustomEvent fired after the Module is hidden
	* args: none
	* @type BANQPAY.util.CustomEvent
	*/
	hideEvent : null,
		
	/**
	* Initializes the custom events for Module which are fired automatically at appropriate times by the Module class.
	*/
	initEvents : function() {

		this.beforeInitEvent		= new BANQPAY.util.CustomEvent("beforeInit");
		this.initEvent				= new BANQPAY.util.CustomEvent("init");

		this.appendEvent			= new BANQPAY.util.CustomEvent("append");

		this.beforeRenderEvent		= new BANQPAY.util.CustomEvent("beforeRender");
		this.renderEvent			= new BANQPAY.util.CustomEvent("render");

		this.changeHeaderEvent		= new BANQPAY.util.CustomEvent("changeHeader");
		this.changeBodyEvent		= new BANQPAY.util.CustomEvent("changeBody");
		this.changeFooterEvent		= new BANQPAY.util.CustomEvent("changeFooter");

		this.changeContentEvent		= new BANQPAY.util.CustomEvent("changeContent");

		this.destroyEvent			= new BANQPAY.util.CustomEvent("destroy");
		this.beforeShowEvent		= new BANQPAY.util.CustomEvent("beforeShow");
		this.showEvent				= new BANQPAY.util.CustomEvent("show");
		this.beforeHideEvent		= new BANQPAY.util.CustomEvent("beforeHide");
		this.hideEvent				= new BANQPAY.util.CustomEvent("hide");
	}, 

	/**
	* String representing the current user-agent platform
	* @type string
	*/
	platform : function() {
					var ua = navigator.userAgent.toLowerCase();
					if (ua.indexOf("windows") != -1 || ua.indexOf("win32") != -1) {
						return "windows";
					} else if (ua.indexOf("macintosh") != -1) {
						return "mac";
					} else {
						return false;
					}
				}(),

	/**
	* String representing the current user-agent browser
	* @type string
	*/
	browser : function() {
			var ua = navigator.userAgent.toLowerCase();
				  if (ua.indexOf('opera')!=-1) { // Opera (check first in case of spoof)
					 return 'opera';
				  } else if (ua.indexOf('msie 7')!=-1) { // IE7
					 return 'ie7';
				  } else if (ua.indexOf('msie') !=-1) { // IE
					 return 'ie';
				  } else if (ua.indexOf('safari')!=-1) { // Safari (check before Gecko because it includes "like Gecko")
					 return 'safari';
				  } else if (ua.indexOf('gecko') != -1) { // Gecko
					 return 'gecko';
				  } else {
					 return false;
				  }
			}(),

	/**
	* Boolean representing whether or not the current browsing context is secure (https)
	* @type boolean
	*/
	isSecure : function() {
		if (window.location.href.toLowerCase().indexOf("https") == 0) {
			this.imageRoot = BANQPAY.widget.Module.IMG_ROOT_SSL;
			return true;
		} else {
			return false;
		}
	}(),

	/**
	* Initializes the custom events for Module which are fired automatically at appropriate times by the Module class.
	*/
	initDefaultConfig : function() {
		// Add properties //

		this.cfg.addProperty("visible", { value:true, handler:this.configVisible, validator:this.cfg.checkBoolean } );
		this.cfg.addProperty("effect", { suppressEvent:true, supercedes:["visible"] } );
		this.cfg.addProperty("monitorresize", { value:true, handler:this.configMonitorResize } );
	},

	/**
	* The Module class's initialization method, which is executed for Module and all of its subclasses. This method is automatically called by the constructor, and  sets up all DOM references for pre-existing markup, and creates required markup if it is not already present.
	* @param {string}	el	The element ID representing the Module <em>OR</em>
	* @param {Element}	el	The element representing the Module
	* @param {object}	userConfig	The configuration object literal containing the configuration that should be set for this module. See configuration documentation for more details.
	*/
	init : function(el, userConfig) {

		this.initEvents();

		this.beforeInitEvent.fire(BANQPAY.widget.Module);

		this.cfg = new BANQPAY.util.Config(this);
		
		if (typeof el == "string") {
			var elId = el;

			el = document.getElementById(el);
			if (! el) {
				el = document.createElement("DIV");
				el.id = elId;
			}
		}

		this.element = el;
		
		if (el.id) {
			this.id = el.id;
		} 

		var childNodes = this.element.childNodes;

		if (childNodes) {
			for (var i=0;i<childNodes.length;i++) {
				var child = childNodes[i];
				switch (child.className) {
					case BANQPAY.widget.Module.CSS_HEADER:
						this.header = child;
						break;
					case BANQPAY.widget.Module.CSS_BODY:
						this.body = child;
						break;
					case BANQPAY.widget.Module.CSS_FOOTER:
						this.footer = child;
						break;
				}
			}
		}

		this.initDefaultConfig();

		BANQPAY.util.Dom.addClass(this.element, BANQPAY.widget.Module.CSS_MODULE);

		if (userConfig) {
			this.cfg.applyConfig(userConfig, true);
		}

		// Subscribe to the fireQueue() method of Config so that any queued configuration changes are
		// excecuted upon render of the Module
		if (! BANQPAY.util.Config.alreadySubscribed(this.renderEvent, this.cfg.fireQueue, this.cfg)) {
			this.renderEvent.subscribe(this.cfg.fireQueue, this.cfg, true);
		}

		this.initEvent.fire(BANQPAY.widget.Module);
	},

	/**
	* Initialized an empty DOM element that is placed out of the visible area that can be used to detect text resize.
	*/
	initResizeMonitor : function() {
		var resizeMonitor = document.getElementById("_yuiResizeMonitor");
		if (! resizeMonitor) {
			resizeMonitor = document.createElement("DIV");
			resizeMonitor.style.position = "absolute";
			resizeMonitor.id = "_yuiResizeMonitor";
			resizeMonitor.style.width = "1em";
			resizeMonitor.style.height = "1em";
			resizeMonitor.style.top = "-1000px";
			resizeMonitor.style.left = "-1000px";
			resizeMonitor.innerHTML = "&nbsp;";
			document.body.appendChild(resizeMonitor);
		}
		this.resizeMonitor = resizeMonitor;
		BANQPAY.util.Event.addListener(this.resizeMonitor, "resize", this.onDomResize, this, true);
	},

	/**
	* Event handler fired when the resize monitor element is resized.
	*/
	onDomResize : function(e, obj) { },

	/**
	* Sets the Module's header content to the HTML specified, or appends the passed element to the header. If no header is present, one will be automatically created.
	* @param {string}	headerContent	The HTML used to set the header <em>OR</em>
	* @param {Element}	headerContent	The Element to append to the header
	*/	
	setHeader : function(headerContent) {
		if (! this.header) {
			this.header = document.createElement("DIV");
			this.header.className = BANQPAY.widget.Module.CSS_HEADER;
		}
		
		if (typeof headerContent == "string") {
			this.header.innerHTML = headerContent;
		} else {
			this.header.innerHTML = "";
			this.header.appendChild(headerContent);
		}

		this.changeHeaderEvent.fire(headerContent);
		this.changeContentEvent.fire();
	},

	/**
	* Appends the passed element to the header. If no header is present, one will be automatically created.
	* @param {Element}	element	The element to append to the header
	*/	
	appendToHeader : function(element) {
		if (! this.header) {
			this.header = document.createElement("DIV");
			this.header.className = BANQPAY.widget.Module.CSS_HEADER;
		}
		
		this.header.appendChild(element);
		this.changeHeaderEvent.fire(element);
		this.changeContentEvent.fire();
	},

	/**
	* Sets the Module's body content to the HTML specified, or appends the passed element to the body. If no body is present, one will be automatically created.
	* @param {string}	bodyContent	The HTML used to set the body <em>OR</em>
	* @param {Element}	bodyContent	The Element to append to the body
	*/		
	setBody : function(bodyContent) {
		if (! this.body) {
			this.body = document.createElement("DIV");
			this.body.className = BANQPAY.widget.Module.CSS_BODY;
		}

		if (typeof bodyContent == "string")
		{
			this.body.innerHTML = bodyContent;
		} else {
			this.body.innerHTML = "";
			this.body.appendChild(bodyContent);
		}

		this.changeBodyEvent.fire(bodyContent);
		this.changeContentEvent.fire();
	},

	/**
	* Appends the passed element to the body. If no body is present, one will be automatically created.
	* @param {Element}	element	The element to append to the body
	*/
	appendToBody : function(element) {
		if (! this.body) {
			this.body = document.createElement("DIV");
			this.body.className = BANQPAY.widget.Module.CSS_BODY;
		}

		this.body.appendChild(element);
		this.changeBodyEvent.fire(element);
		this.changeContentEvent.fire();
	},

	/**
	* Sets the Module's footer content to the HTML specified, or appends the passed element to the footer. If no footer is present, one will be automatically created.
	* @param {string}	footerContent	The HTML used to set the footer <em>OR</em>
	* @param {Element}	footerContent	The Element to append to the footer
	*/	
	setFooter : function(footerContent) {
		if (! this.footer) {
			this.footer = document.createElement("DIV");
			this.footer.className = BANQPAY.widget.Module.CSS_FOOTER;
		}

		if (typeof footerContent == "string") {
			this.footer.innerHTML = footerContent;
		} else {
			this.footer.innerHTML = "";
			this.footer.appendChild(footerContent);
		}

		this.changeFooterEvent.fire(footerContent);
		this.changeContentEvent.fire();
	},

	/**
	* Appends the passed element to the footer. If no footer is present, one will be automatically created.
	* @param {Element}	element	The element to append to the footer
	*/
	appendToFooter : function(element) {
		if (! this.footer) {
			this.footer = document.createElement("DIV");
			this.footer.className = BANQPAY.widget.Module.CSS_FOOTER;
		}

		this.footer.appendChild(element);
		this.changeFooterEvent.fire(element);
		this.changeContentEvent.fire();
	},

	/**
	* Renders the Module by inserting the elements that are not already in the main Module into their correct places. Optionally appends the Module to the specified node prior to the render's execution. NOTE: For Modules without existing markup, the appendToNode argument is REQUIRED. If this argument is ommitted and the current element is not present in the document, the function will return false, indicating that the render was a failure.
	* @param {string}	appendToNode	The element id to which the Module should be appended to prior to rendering <em>OR</em>
	* @param {Element}	appendToNode	The element to which the Module should be appended to prior to rendering	
	* @param {Element}	moduleElement	OPTIONAL. The element that represents the actual Standard Module container. 
	* @return {boolean} Success or failure of the render
	*/
	render : function(appendToNode, moduleElement) {
		this.beforeRenderEvent.fire();

		if (! moduleElement) {
			moduleElement = this.element;
		}

		var me = this;
		var appendTo = function(element) {
			if (typeof element == "string") {
				element = document.getElementById(element);
			}
			
			if (element) {
				element.appendChild(me.element);
				me.appendEvent.fire();
			}
		}

		if (appendToNode) {
			appendTo(appendToNode);
		} else { // No node was passed in. If the element is not pre-marked up, this fails
			if (! BANQPAY.util.Dom.inDocument(this.element)) {
				return false;
			}
		}

		// Need to get everything into the DOM if it isn't already
		
		if (this.header && ! BANQPAY.util.Dom.inDocument(this.header)) {
			// There is a header, but it's not in the DOM yet... need to add it
			var firstChild = moduleElement.firstChild;
			if (firstChild) { // Insert before first child if exists
				moduleElement.insertBefore(this.header, firstChild);
			} else { // Append to empty body because there are no children
				moduleElement.appendChild(this.header);
			}
		}

		if (this.body && ! BANQPAY.util.Dom.inDocument(this.body)) {
			// There is a body, but it's not in the DOM yet... need to add it
			if (this.footer && BANQPAY.util.Dom.isAncestor(this.moduleElement, this.footer)) { // Insert before footer if exists in DOM
				moduleElement.insertBefore(this.body, this.footer);
			} else { // Append to element because there is no footer
				moduleElement.appendChild(this.body);
			}
		}

		if (this.footer && ! BANQPAY.util.Dom.inDocument(this.footer)) {
			// There is a footer, but it's not in the DOM yet... need to add it
			moduleElement.appendChild(this.footer);
		}

		this.renderEvent.fire();
		return true;
	},

	/**
	* Removes the Module element from the DOM and sets all child elements to null.
	*/
	destroy : function() {
		if (this.element) {
			var parent = this.element.parentNode;
		}
		if (parent) {
			parent.removeChild(this.element);
		}

		this.element = null;
		this.header = null;
		this.body = null;
		this.footer = null;

		this.destroyEvent.fire();
	},

	/**
	* Shows the Module element by setting the visible configuration property to true. Also fires two events: beforeShowEvent prior to the visibility change, and showEvent after.
	*/
	show : function() {
		this.cfg.setProperty("visible", true);
	},

	/**
	* Hides the Module element by setting the visible configuration property to false. Also fires two events: beforeHideEvent prior to the visibility change, and hideEvent after.
	*/
	hide : function() {
		this.cfg.setProperty("visible", false);
	},

	// BUILT-IN EVENT HANDLERS FOR MODULE //

	/**
	* Default event handler for changing the visibility property of a Module. By default, this is achieved by switching the "display" style between "block" and "none".
	* This method is responsible for firing showEvent and hideEvent.
	*/
	configVisible : function(type, args, obj) {
		var visible = args[0];
		if (visible) {
			this.beforeShowEvent.fire();
			BANQPAY.util.Dom.setStyle(this.element, "display", "block");
			this.showEvent.fire();
		} else {
			this.beforeHideEvent.fire();
			BANQPAY.util.Dom.setStyle(this.element, "display", "none");
			this.hideEvent.fire();
		}
	},

	/**
	* Default event handler for the "monitorresize" configuration property
	*/
	configMonitorResize : function(type, args, obj) {
		var monitor = args[0];
		if (monitor) {
			this.initResizeMonitor();
		} else {
			BANQPAY.util.Event.removeListener(this.resizeMonitor, "resize", this.onDomResize);
			this.resizeMonitor = null;
		}
	}
}
/**
Copyright (c) 2006, BANQPAY! Inc. All rights reserved.
Code licensed under the BSD License:
http://developer.BANQPAY.net/yui/license.txt
* @class Overlay is a Module that is absolutely positioned above the page flow. It has convenience methods for positioning and sizing, as well as options for controlling zIndex and constraining the Overlay's position to the current visible viewport. Overlay also contains a dynamicly generated IFRAME which is placed beneath it for Internet Explorer 6 and 5.x so that it will be properly rendered above SELECT elements.
* @param {string}	el	The element ID representing the Overlay <em>OR</em>
* @param {Element}	el	The element representing the Overlay
* @param {object}	userConfig	The configuration object literal containing the configuration that should be set for this Overlay. See configuration documentation for more details.
* @constructor
*/
BANQPAY.widget.Overlay = function(el, userConfig) {
	if (arguments.length > 0) {
		BANQPAY.widget.Overlay.superclass.constructor.call(this, el, userConfig);
	}
}

BANQPAY.widget.Overlay.prototype = new BANQPAY.widget.Module();
BANQPAY.widget.Overlay.prototype.constructor = BANQPAY.widget.Overlay;

/**
* Reference to the Overlay's superclass, Module
* @type class
* @final
*/
BANQPAY.widget.Overlay.superclass = BANQPAY.widget.Module.prototype;

/**
* The URL of the blank image that will be placed in the iframe
* @type string
* @final
*/
BANQPAY.widget.Overlay.IFRAME_SRC = "promo/m/irs/blank.gif";

/**
* Constant representing the top left corner of an element, used for configuring the context element alignment
* @type string
* @final
*/
BANQPAY.widget.Overlay.TOP_LEFT = "tl";

/**
* Constant representing the top right corner of an element, used for configuring the context element alignment
* @type string
* @final
*/
BANQPAY.widget.Overlay.TOP_RIGHT = "tr";

/**
* Constant representing the top bottom left corner of an element, used for configuring the context element alignment
* @type string
* @final
*/
BANQPAY.widget.Overlay.BOTTOM_LEFT = "bl";

/**
* Constant representing the bottom right corner of an element, used for configuring the context element alignment
* @type string
* @final
*/
BANQPAY.widget.Overlay.BOTTOM_RIGHT = "br";

/**
* Constant representing the default CSS class used for an Overlay
* @type string
* @final
*/
BANQPAY.widget.Overlay.CSS_OVERLAY = "overlay";

/**
* CustomEvent fired before the Overlay is moved.
* args: x,y that the Overlay will be moved to
* @type BANQPAY.util.CustomEvent
*/
BANQPAY.widget.Overlay.prototype.beforeMoveEvent = null;

/**
* CustomEvent fired after the Overlay is moved.
* args: x,y that the Overlay was moved to
* @type BANQPAY.util.CustomEvent
*/
BANQPAY.widget.Overlay.prototype.moveEvent = null;

/*
* The Overlay initialization method, which is executed for Overlay and all of its subclasses. This method is automatically called by the constructor, and  sets up all DOM references for pre-existing markup, and creates required markup if it is not already present.
* @param {string}	el	The element ID representing the Overlay <em>OR</em>
* @param {Element}	el	The element representing the Overlay
* @param {object}	userConfig	The configuration object literal containing the configuration that should be set for this Overlay. See configuration documentation for more details.
*/
BANQPAY.widget.Overlay.prototype.init = function(el, userConfig) {
	BANQPAY.widget.Overlay.superclass.init.call(this, el/*, userConfig*/);  // Note that we don't pass the user config in here yet because we only want it executed once, at the lowest subclass level
	
	this.beforeInitEvent.fire(BANQPAY.widget.Overlay);

	BANQPAY.util.Dom.addClass(this.element, BANQPAY.widget.Overlay.CSS_OVERLAY);

	if (userConfig) {
		this.cfg.applyConfig(userConfig, true);
	}

	if (this.platform == "mac" && this.browser == "gecko") {
		if (! BANQPAY.util.Config.alreadySubscribed(this.showEvent,this.showMacGeckoScrollbars,this)) {
			this.showEvent.subscribe(this.showMacGeckoScrollbars,this,true);
		}
		if (! BANQPAY.util.Config.alreadySubscribed(this.hideEvent,this.hideMacGeckoScrollbars,this)) {
			this.hideEvent.subscribe(this.hideMacGeckoScrollbars,this,true);
		}
	}

	this.initEvent.fire(BANQPAY.widget.Overlay);

}

/**
* Initializes the custom events for Overlay which are fired automatically at appropriate times by the Overlay class.
*/
BANQPAY.widget.Overlay.prototype.initEvents = function() {
	BANQPAY.widget.Overlay.superclass.initEvents.call(this);

	this.beforeMoveEvent = new BANQPAY.util.CustomEvent("beforeMove", this);
	this.moveEvent = new BANQPAY.util.CustomEvent("move", this);
}

/**
* Initializes the class's configurable properties which can be changed using the Overlay's Config object (cfg).
*/
BANQPAY.widget.Overlay.prototype.initDefaultConfig = function() {
	BANQPAY.widget.Overlay.superclass.initDefaultConfig.call(this);

	// Add overlay config properties //
	this.cfg.addProperty("x", { handler:this.configX, validator:this.cfg.checkNumber, suppressEvent:true, supercedes:["iframe"] } );
	this.cfg.addProperty("y", { handler:this.configY, validator:this.cfg.checkNumber, suppressEvent:true, supercedes:["iframe"] } );
	this.cfg.addProperty("xy",{ handler:this.configXY, suppressEvent:true, supercedes:["iframe"] } );

	this.cfg.addProperty("context",	{ handler:this.configContext, suppressEvent:true, supercedes:["iframe"] } );
	this.cfg.addProperty("fixedcenter", { value:false, handler:this.configFixedCenter, validator:this.cfg.checkBoolean, supercedes:["iframe","visible"] } );

	this.cfg.addProperty("width", { handler:this.configWidth, suppressEvent:true, supercedes:["iframe"] } );
	this.cfg.addProperty("height", { handler:this.configHeight, suppressEvent:true, supercedes:["iframe"] } );

	this.cfg.addProperty("zIndex", { value:null, handler:this.configzIndex } );

	this.cfg.addProperty("constraintoviewport", { value:false, handler:this.configConstrainToViewport, validator:this.cfg.checkBoolean, supercedes:["iframe","x","y","xy"] } );
	this.cfg.addProperty("iframe", { value:(this.browser == "ie" ? true : false), handler:this.configIframe, validator:this.cfg.checkBoolean, supercedes:["zIndex"] } );
}

/**
* Moves the Overlay to the specified position. This function is identical to calling this.cfg.setProperty("xy", [x,y]);
* @param {int}	x	The Overlay's new x position
* @param {int}	y	The Overlay's new y position
*/
BANQPAY.widget.Overlay.prototype.moveTo = function(x, y) {
	this.cfg.setProperty("xy",[x,y]);
}

/**
* Adds a special CSS class to the Overlay when Mac/Gecko is in use, to work around a Gecko bug where
* scrollbars cannot be hidden. See https://bugzilla.mozilla.org/show_bug.cgi?id=187435
*/
BANQPAY.widget.Overlay.prototype.hideMacGeckoScrollbars = function() {
	BANQPAY.util.Dom.removeClass(this.element, "show-scrollbars");
	BANQPAY.util.Dom.addClass(this.element, "hide-scrollbars");
}

/**
* Removes a special CSS class from the Overlay when Mac/Gecko is in use, to work around a Gecko bug where
* scrollbars cannot be hidden. See https://bugzilla.mozilla.org/show_bug.cgi?id=187435
*/
BANQPAY.widget.Overlay.prototype.showMacGeckoScrollbars = function() {
	BANQPAY.util.Dom.removeClass(this.element, "hide-scrollbars");
	BANQPAY.util.Dom.addClass(this.element, "show-scrollbars");
}

// BEGIN BUILT-IN PROPERTY EVENT HANDLERS //

/**
* The default event handler fired when the "visible" property is changed. This method is responsible for firing showEvent and hideEvent.
*/
BANQPAY.widget.Overlay.prototype.configVisible = function(type, args, obj) {
	var visible = args[0];
	var currentVis = BANQPAY.util.Dom.getStyle(this.element, "visibility");

	var effect = this.cfg.getProperty("effect");

	var effectInstances = new Array();
	if (effect) {
		if (effect instanceof Array) {
			for (var i=0;i<effect.length;i++) {
				var eff = effect[i];
				effectInstances[effectInstances.length] = eff.effect(this, eff.duration);
			}
		} else {
			effectInstances[effectInstances.length] = effect.effect(this, effect.duration);
		}
	}

	var isMacGecko = (this.platform == "mac" && this.browser == "gecko");

	if (visible) { // Show
		if (isMacGecko) {
			this.showMacGeckoScrollbars();
		}	

		if (effect) { // Animate in
			if (visible) { // Animate in if not showing
				if (currentVis != "visible") {
					this.beforeShowEvent.fire();
					for (var i=0;i<effectInstances.length;i++) {
						var e = effectInstances[i];
						if (i == 0 && ! BANQPAY.util.Config.alreadySubscribed(e.animateInCompleteEvent,this.showEvent.fire,this.showEvent)) {
							e.animateInCompleteEvent.subscribe(this.showEvent.fire,this.showEvent,true); // Delegate showEvent until end of animateInComplete
						}
						e.animateIn();
					}
				}
			}
		} else { // Show
			if (currentVis != "visible") {
				this.beforeShowEvent.fire();
				BANQPAY.util.Dom.setStyle(this.element, "visibility", "visible");
				this.cfg.refireEvent("iframe");
				this.showEvent.fire();
			}
		}

	} else { // Hide
		if (isMacGecko) {
			this.hideMacGeckoScrollbars();
		}	

		if (effect) { // Animate out if showing
			if (currentVis != "hidden") {
				this.beforeHideEvent.fire();
				for (var i=0;i<effectInstances.length;i++) {
					var e = effectInstances[i];
					if (i == 0 && ! BANQPAY.util.Config.alreadySubscribed(e.animateOutCompleteEvent,this.hideEvent.fire,this.hideEvent)) {				
						e.animateOutCompleteEvent.subscribe(this.hideEvent.fire,this.hideEvent,true); // Delegate hideEvent until end of animateOutComplete
					}
					e.animateOut();
				}
			}
		} else { // Simple hide
			if (currentVis != "hidden") {
				this.beforeHideEvent.fire();
				BANQPAY.util.Dom.setStyle(this.element, "visibility", "hidden");
				this.cfg.refireEvent("iframe");
				this.hideEvent.fire();
			}
		}	
	}
}

/**
* Center event handler used for centering on scroll/resize, but only if the Overlay is visible
*/
BANQPAY.widget.Overlay.prototype.doCenterOnDOMEvent = function() {
	if (this.cfg.getProperty("visible")) {
		this.center();
	}
}

/**
* The default event handler fired when the "fixedcenter" property is changed.
*/
BANQPAY.widget.Overlay.prototype.configFixedCenter = function(type, args, obj) {
	var val = args[0];

	if (val) {
		this.center();
			
		if (! BANQPAY.util.Config.alreadySubscribed(this.beforeShowEvent, this.center, this)) {
			this.beforeShowEvent.subscribe(this.center, this, true);
		}
		
		if (! BANQPAY.util.Config.alreadySubscribed(BANQPAY.widget.Overlay.windowResizeEvent, this.doCenterOnDOMEvent, this)) {
			BANQPAY.widget.Overlay.windowResizeEvent.subscribe(this.doCenterOnDOMEvent, this, true);
		}

		if (! BANQPAY.util.Config.alreadySubscribed(BANQPAY.widget.Overlay.windowScrollEvent, this.doCenterOnDOMEvent, this)) {
			BANQPAY.widget.Overlay.windowScrollEvent.subscribe( this.doCenterOnDOMEvent, this, true);
		}
	} else {
		BANQPAY.widget.Overlay.windowResizeEvent.unsubscribe(this.doCenterOnDOMEvent, this);
		BANQPAY.widget.Overlay.windowScrollEvent.unsubscribe(this.doCenterOnDOMEvent, this);
	}
}

/**
* The default event handler fired when the "height" property is changed.
*/
BANQPAY.widget.Overlay.prototype.configHeight = function(type, args, obj) {
	var height = args[0];
	var el = this.element;
	BANQPAY.util.Dom.setStyle(el, "height", height);
	this.cfg.refireEvent("iframe");
}

/**
* The default event handler fired when the "width" property is changed.
*/
BANQPAY.widget.Overlay.prototype.configWidth = function(type, args, obj) {
	var width = args[0];
	var el = this.element;
	BANQPAY.util.Dom.setStyle(el, "width", width);
	this.cfg.refireEvent("iframe");
}

/**
* The default event handler fired when the "zIndex" property is changed.
*/
BANQPAY.widget.Overlay.prototype.configzIndex = function(type, args, obj) {
	var zIndex = args[0];

	var el = this.element;

	if (! zIndex) {
		zIndex = BANQPAY.util.Dom.getStyle(el, "zIndex");
		if (! zIndex || isNaN(zIndex)) {
			zIndex = 0;
		}
	}

	if (this.iframe) {
		if (zIndex <= 0) {
			zIndex = 1;
		}
		BANQPAY.util.Dom.setStyle(this.iframe, "zIndex", (zIndex-1));
	}

	BANQPAY.util.Dom.setStyle(el, "zIndex", zIndex);
	this.cfg.setProperty("zIndex", zIndex, true);
}

/**
* The default event handler fired when the "xy" property is changed.
*/
BANQPAY.widget.Overlay.prototype.configXY = function(type, args, obj) {
	var pos = args[0];
	var x = pos[0];
	var y = pos[1];

	this.cfg.setProperty("x", x);
	this.cfg.setProperty("y", y);

	this.beforeMoveEvent.fire([x,y]);

	x = this.cfg.getProperty("x");
	y = this.cfg.getProperty("y");

	this.cfg.refireEvent("iframe");
	this.moveEvent.fire([x,y]);
}

/**
* The default event handler fired when the "x" property is changed.
*/
BANQPAY.widget.Overlay.prototype.configX = function(type, args, obj) {
	var x = args[0];
	var y = this.cfg.getProperty("y");

	this.cfg.setProperty("x", x, true);
	this.cfg.setProperty("y", y, true);

	this.beforeMoveEvent.fire([x,y]);

	x = this.cfg.getProperty("x");
	y = this.cfg.getProperty("y");

	BANQPAY.util.Dom.setX(this.element, x, true);
	
	this.cfg.setProperty("xy", [x, y], true);

	this.cfg.refireEvent("iframe");
	this.moveEvent.fire([x, y]);
}

/**
* The default event handler fired when the "y" property is changed.
*/
BANQPAY.widget.Overlay.prototype.configY = function(type, args, obj) {
	var x = this.cfg.getProperty("x");
	var y = args[0];

	this.cfg.setProperty("x", x, true);
	this.cfg.setProperty("y", y, true);

	this.beforeMoveEvent.fire([x,y]);

	x = this.cfg.getProperty("x");
	y = this.cfg.getProperty("y");

	BANQPAY.util.Dom.setY(this.element, y, true);

	this.cfg.setProperty("xy", [x, y], true);

	this.cfg.refireEvent("iframe");
	this.moveEvent.fire([x, y]);
}

/**
* The default event handler fired when the "iframe" property is changed.
*/
BANQPAY.widget.Overlay.prototype.configIframe = function(type, args, obj) {
	var val = args[0];

	var el = this.element;

	if (val) {
		var x = this.cfg.getProperty("x");
		var y = this.cfg.getProperty("y");

		if (! x || ! y) {
			this.syncPosition();
			x = this.cfg.getProperty("x");
			y = this.cfg.getProperty("y");
		}

		if (! isNaN(x) && ! isNaN(y)) {
			if (! this.iframe) {
				this.iframe = document.createElement("iframe");
				
				var parent = el.parentNode;
				if (parent) {
					parent.appendChild(this.iframe);
				} else {
					document.body.appendChild(this.iframe);
				}

				this.iframe.src = this.imageRoot + BANQPAY.widget.Overlay.IFRAME_SRC;
				BANQPAY.util.Dom.setStyle(this.iframe, "position", "absolute");
				BANQPAY.util.Dom.setStyle(this.iframe, "border", "none");
				BANQPAY.util.Dom.setStyle(this.iframe, "margin", "0");
				BANQPAY.util.Dom.setStyle(this.iframe, "padding", "0");
				BANQPAY.util.Dom.setStyle(this.iframe, "opacity", "0");
			}

			BANQPAY.util.Dom.setStyle(this.iframe, "left", x-2 + "px");
			BANQPAY.util.Dom.setStyle(this.iframe, "top", y-2 + "px");

			var width = el.clientWidth;
			var height = el.clientHeight;

			BANQPAY.util.Dom.setStyle(this.iframe, "width", (width+2) + "px");
			BANQPAY.util.Dom.setStyle(this.iframe, "height", (height+2) + "px");

			if (! this.cfg.getProperty("visible")) {
				this.iframe.style.display = "none";
			} else {
				this.iframe.style.display = "block";
			}
		}
	} else {
		if (this.iframe) {
			this.iframe.style.display = "none";
		}
	}
}

/**
* The default event handler fired when the "constraintoviewport" property is changed.
*/
BANQPAY.widget.Overlay.prototype.configConstrainToViewport = function(type, args, obj) {
	var val = args[0];
	if (val) {
		if (! BANQPAY.util.Config.alreadySubscribed(this.beforeMoveEvent, this.enforceConstraints, this)) {
			this.beforeMoveEvent.subscribe(this.enforceConstraints, this, true);
		}
	} else {
		this.beforeMoveEvent.unsubscribe(this.enforceConstraints, this);
	}
}

/**
* The default event handler fired when the "context" property is changed.
*/
BANQPAY.widget.Overlay.prototype.configContext = function(type, args, obj) {
	var contextArgs = args[0];

	if (contextArgs) {
		var contextEl = contextArgs[0];
		var elementMagnetCorner = contextArgs[1];
		var contextMagnetCorner = contextArgs[2];

		if (contextEl) {
			if (typeof contextEl == "string") {
				this.cfg.setProperty("context", [document.getElementById(contextEl),elementMagnetCorner,contextMagnetCorner], true);
			}
			
			if (elementMagnetCorner && contextMagnetCorner) {
				this.align(elementMagnetCorner, contextMagnetCorner);
			}
		}	
	}
}


// END BUILT-IN PROPERTY EVENT HANDLERS //

/**
* Aligns the Overlay to its context element using the specified corner points (represented by the constants TOP_LEFT, TOP_RIGHT, BOTTOM_LEFT, and BOTTOM_RIGHT.
* @param {string} elementAlign		The string representing the corner of the Overlay that should be aligned to the context element
* @param {string} contextAlign		The corner of the context element that the elementAlign corner should stick to.
*/
BANQPAY.widget.Overlay.prototype.align = function(elementAlign, contextAlign) {
	var contextArgs = this.cfg.getProperty("context");
	if (contextArgs) {
		var context = contextArgs[0];
		
		var element = this.element;
		var me = this;

		if (! elementAlign) {
			elementAlign = contextArgs[1];
		}

		if (! contextAlign) {
			contextAlign = contextArgs[2];
		}

		if (element && context) {
			var elementRegion = BANQPAY.util.Dom.getRegion(element);
			var contextRegion = BANQPAY.util.Dom.getRegion(context);

			var doAlign = function(v,h) {
				switch (elementAlign) {
					case BANQPAY.widget.Overlay.TOP_LEFT:
						me.moveTo(h,v);
						break;
					case BANQPAY.widget.Overlay.TOP_RIGHT:
						me.moveTo(h-element.offsetWidth,v);
						break;
					case BANQPAY.widget.Overlay.BOTTOM_LEFT:
						me.moveTo(h,v-element.offsetHeight);
						break;
					case BANQPAY.widget.Overlay.BOTTOM_RIGHT:
						me.moveTo(h-element.offsetWidth,v-element.offsetHeight);
						break;
				}
			}

			switch (contextAlign) {
				case BANQPAY.widget.Overlay.TOP_LEFT:
					doAlign(contextRegion.top, contextRegion.left);
					break;
				case BANQPAY.widget.Overlay.TOP_RIGHT:
					doAlign(contextRegion.top, contextRegion.right);
					break;		
				case BANQPAY.widget.Overlay.BOTTOM_LEFT:
					doAlign(contextRegion.bottom, contextRegion.left);
					break;
				case BANQPAY.widget.Overlay.BOTTOM_RIGHT:
					doAlign(contextRegion.bottom, contextRegion.right);
					break;
			}
		}
	}
}

/**
* The default event handler executed when the moveEvent is fired, if the "constraintoviewport" is set to true.
*/
BANQPAY.widget.Overlay.prototype.enforceConstraints = function(type, args, obj) {
	var pos = args[0];

	var x = pos[0];
	var y = pos[1];

	var width = parseInt(this.cfg.getProperty("width"));

	if (isNaN(width)) {
		width = 0;
	}

	var offsetHeight = this.element.offsetHeight;
	var offsetWidth = (width>0?width:this.element.offsetWidth); //this.element.offsetWidth;

	var viewPortWidth = BANQPAY.util.Dom.getViewportWidth();
	var viewPortHeight = BANQPAY.util.Dom.getViewportHeight();

	var scrollX = window.scrollX || document.documentElement.scrollLeft;
	var scrollY = window.scrollY || document.documentElement.scrollTop;

	var topConstraint = scrollY + 10;
	var leftConstraint = scrollX + 10;
	var bottomConstraint = scrollY + viewPortHeight - offsetHeight - 10;
	var rightConstraint = scrollX + viewPortWidth - offsetWidth - 10;
	
	if (x < leftConstraint) {
		x = leftConstraint;
	} else if (x > rightConstraint) {
		x = rightConstraint;
	}

	if (y < topConstraint) {
		y = topConstraint;
	} else if (y > bottomConstraint) {
		y = bottomConstraint;
	}

	this.cfg.setProperty("x", x, true);
	this.cfg.setProperty("y", y, true);
	this.cfg.setProperty("xy", [x,y], true);
}

/**
* Centers the container in the viewport.
*/
BANQPAY.widget.Overlay.prototype.center = function() {
	var scrollX = window.scrollX || document.documentElement.scrollLeft;
	var scrollY = window.scrollY || document.documentElement.scrollTop;

	var viewPortWidth = BANQPAY.util.Dom.getClientWidth();
	var viewPortHeight = BANQPAY.util.Dom.getClientHeight();

	var elementWidth = this.element.offsetWidth;
	var elementHeight = this.element.offsetHeight;

	var x = (viewPortWidth / 2) - (elementWidth / 2) + scrollX;
	var y = (viewPortHeight / 2) - (elementHeight / 2) + scrollY;
	
	this.element.style.left = parseInt(x) + "px";
	this.element.style.top = parseInt(y) + "px";
	this.syncPosition();

	this.cfg.refireEvent("iframe");
}

/**
* Synchronizes the Panel's "xy", "x", and "y" properties with the Panel's position in the DOM. This is primarily used to update position information during drag & drop.
*/
BANQPAY.widget.Overlay.prototype.syncPosition = function() {
	var pos = BANQPAY.util.Dom.getXY(this.element);
	this.cfg.setProperty("x", pos[0], true);
	this.cfg.setProperty("y", pos[1], true);
	this.cfg.setProperty("xy", pos, true);
}

/**
* Event handler fired when the resize monitor element is resized.
*/
BANQPAY.widget.Overlay.prototype.onDomResize = function(e, obj) {
	BANQPAY.widget.Overlay.superclass.onDomResize.call(this, e, obj);
	this.cfg.refireEvent("iframe");
}

/**
* A singleton CustomEvent used for reacting to the DOM event for window scroll
* @type BANQPAY.util.CustomEvent
*/
BANQPAY.widget.Overlay.windowScrollEvent = new BANQPAY.util.CustomEvent("windowScroll");

/**
* A singleton CustomEvent used for reacting to the DOM event for window resize
* @type BANQPAY.util.CustomEvent
*/
BANQPAY.widget.Overlay.windowResizeEvent = new BANQPAY.util.CustomEvent("windowResize");

/**
* The DOM event handler used to fire the CustomEvent for window scroll
* @type Function
*/
BANQPAY.widget.Overlay.windowScrollHandler = function(e) {
	BANQPAY.widget.Overlay.windowScrollEvent.fire();
}

/**
* The DOM event handler used to fire the CustomEvent for window resize
* @type Function
*/
BANQPAY.widget.Overlay.windowResizeHandler = function(e) {
	BANQPAY.widget.Overlay.windowResizeEvent.fire();
}


if (BANQPAY.widget.Overlay._initialized == undefined) {
	BANQPAY.util.Event.addListener(window, "scroll", BANQPAY.widget.Overlay.windowScrollHandler);
	BANQPAY.util.Event.addListener(window, "resize", BANQPAY.widget.Overlay.windowResizeHandler);
	/**
	* @private
	*/
	BANQPAY.widget.Overlay._initialized = true;
}
/**
Copyright (c) 2006, BANQPAY! Inc. All rights reserved.
Code licensed under the BSD License:
http://developer.BANQPAY.net/yui/license.txt
* @class
* OverlayManager is used for maintaining the focus status of multiple Overlays.
* @param {Array}	overlays	Optional. A collection of Overlays to register with the manager.
* @param {object}	userConfig		The object literal representing the user configuration of the OverlayManager
* @constructor
*/
BANQPAY.widget.OverlayManager = function(userConfig) {
	this.init(userConfig);
}

/**
* The CSS class representing a focused Overlay
* @type string
*/
BANQPAY.widget.OverlayManager.CSS_FOCUSED = "focused";

BANQPAY.widget.OverlayManager.prototype = {

	constructor : BANQPAY.widget.OverlayManager,

	/**
	* The array of Overlays that are currently registered
	* @type Array
	*/
	overlays : new Array(),

	/**
	* Initializes the default configuration of the OverlayManager
	*/	
	initDefaultConfig : function() {
		this.cfg.addProperty("overlays", { suppressEvent:true } );
		this.cfg.addProperty("focusevent", { value:"mousedown" } );
	}, 

	/**
	* Returns the currently focused Overlay
	* @return {Overlay}	The currently focused Overlay
	*/
	getActive : function() {},

	/**
	* Focuses the specified Overlay
	* @param {Overlay}	The Overlay to focus
	* @param {string}	The id of the Overlay to focus
	*/
	focus : function(overlay) {},

	/**
	* Removes the specified Overlay from the manager
	* @param {Overlay}	The Overlay to remove
	* @param {string}	The id of the Overlay to remove
	*/
	remove: function(overlay) {},

	/**
	* Removes focus from all registered Overlays in the manager
	*/
	blurAll : function() {},

	/**
	* Initializes the OverlayManager
	* @param {Array}	overlays	Optional. A collection of Overlays to register with the manager.
	* @param {object}	userConfig		The object literal representing the user configuration of the OverlayManager
	*/
	init : function(userConfig) {
		this.cfg = new BANQPAY.util.Config(this);

		this.initDefaultConfig();

		if (userConfig) {
			this.cfg.applyConfig(userConfig, true);
		}
		this.cfg.fireQueue();

		var activeOverlay = null;

		this.getActive = function() {
			return activeOverlay;
		}

		this.focus = function(overlay) {
			var o = this.find(overlay);
			if (o) {
				this.blurAll();
				activeOverlay = o;
				BANQPAY.util.Dom.addClass(activeOverlay.element, BANQPAY.widget.OverlayManager.CSS_FOCUSED);
				this.overlays.sort(this.compareZIndexDesc);
				var topZIndex = BANQPAY.util.Dom.getStyle(this.overlays[0].element, "zIndex");
				if (! isNaN(topZIndex) && this.overlays[0] != overlay) {
					activeOverlay.cfg.setProperty("zIndex", (parseInt(topZIndex) + 1));
				}
				this.overlays.sort(this.compareZIndexDesc);
			}
		}

		this.remove = function(overlay) {
			var o = this.find(overlay);
			if (o) {
				var originalZ = BANQPAY.util.Dom.getStyle(o.element, "zIndex");
				o.cfg.setProperty("zIndex", -1000, true);
				this.overlays.sort(this.compareZIndexDesc);
				this.overlays = this.overlays.slice(0, this.overlays.length-1);
				o.cfg.setProperty("zIndex", originalZ, true);

				o.cfg.setProperty("manager", null);
				o.focusEvent = null
				o.blurEvent = null;
				o.focus = null;
				o.blur = null;
			}
		}

		this.blurAll = function() {
			activeOverlay = null;
			for (var o=0;o<this.overlays.length;o++) {
				BANQPAY.util.Dom.removeClass(this.overlays[o].element, BANQPAY.widget.OverlayManager.CSS_FOCUSED);
			}		
		}

		var overlays = this.cfg.getProperty("overlays");

		if (overlays) {
			this.register(overlays);
			this.overlays.sort(this.compareZIndexDesc);
		}
	},

	/**
	* Registers an Overlay or an array of Overlays with the manager. Upon registration, the Overlay receives functions for focus and blur, along with CustomEvents for each.
	* @param {Overlay}	overlay		An Overlay to register with the manager.
	* @param {Overlay[]}	overlay		An array of Overlays to register with the manager.
	* @return	{boolean}	True if any Overlays are registered.
	*/
	register : function(overlay) {
		if (overlay instanceof BANQPAY.widget.Overlay) {
			overlay.cfg.addProperty("manager", { value:this } );

			overlay.focusEvent = new BANQPAY.util.CustomEvent("focus");
			overlay.blurEvent = new BANQPAY.util.CustomEvent("blur");
			
			var mgr=this;

			overlay.focus = function() {
				mgr.focus(this);
				this.focusEvent.fire();
			} 

			overlay.blur = function() {
				mgr.blurAll();
				this.blurEvent.fire();
			}

			var focusOnDomEvent = function(e,obj) {
				mgr.focus(overlay);
			}
			
			var focusevent = this.cfg.getProperty("focusevent");
			BANQPAY.util.Event.addListener(overlay.element,focusevent,focusOnDomEvent,this,true);

			var zIndex = BANQPAY.util.Dom.getStyle(overlay.element, "zIndex");
			if (! isNaN(zIndex)) {
				overlay.cfg.setProperty("zIndex", parseInt(zIndex));
			} else {
				overlay.cfg.setProperty("zIndex", 0);
			}
			
			this.overlays.push(overlay);
			return true;
		} else if (overlay instanceof Array) {
			var regcount = 0;
			for (var i=0;i<overlay.length;i++) {
				if (this.register(overlay[i])) {
					regcount++;
				}
			}
			if (regcount > 0) {
				return true;
			}
		} else {
			return false;
		}
	},

	/**
	* Attempts to locate an Overlay by instance or ID.
	* @param {Overlay}	overlay		An Overlay to locate within the manager
	* @param {string}	overlay		An Overlay id to locate within the manager
	* @return	{Overlay}	The requested Overlay, if found, or null if it cannot be located.
	*/
	find : function(overlay) {
		if (overlay instanceof BANQPAY.widget.Overlay) {
			for (var o=0;o<this.overlays.length;o++) {
				if (this.overlays[o] == overlay) {
					return this.overlays[o];
				}
			}
		} else if (typeof overlay == "string") {
			for (var o=0;o<this.overlays.length;o++) {
				if (this.overlays[o].id == overlay) {
					return this.overlays[o];
				}
			}			
		}
		return null;
	},

	/**
	* Used for sorting the manager's Overlays by z-index.
	* @private
	*/
	compareZIndexDesc : function(o1, o2) {
		var zIndex1 = o1.cfg.getProperty("zIndex");
		var zIndex2 = o2.cfg.getProperty("zIndex");

		if (zIndex1 > zIndex2) {
			return -1;
		} else if (zIndex1 < zIndex2) {
			return 1;
		} else {
			return 0;
		}
	},

	/**
	* Shows all Overlays in the manager.
	*/
	showAll : function() {
		for (var o=0;o<this.overlays.length;o++) {
			this.overlays[o].show();
		}
	},

	/**
	* Hides all Overlays in the manager.
	*/
	hideAll : function() {
		for (var o=0;o<this.overlays.length;o++) {
			this.overlays[o].hide();
		}
	}

}/**
Copyright (c) 2006, BANQPAY! Inc. All rights reserved.
Code licensed under the BSD License:
http://developer.BANQPAY.net/yui/license.txt
* @class 
* KeyListener is a utility that provides an easy interface for listening for keydown/keyup events fired against DOM elements.
* @param {Element}	attachTo	The element or element ID to which the key event should be attached
* @param {string}	attachTo	The element or element ID to which the key event should be attached
* @param (object}	keyData		The object literal representing the key(s) to detect. Possible attributes are shift(boolean), alt(boolean), ctrl(boolean) and keys(either an int or an array of ints representing keycodes).
* @param {function}	handler		The CustomEvent handler to fire when the key event is detected
* @param {object}	handler		An object literal representing the handler. 
* @param {string}	event		Optional. The event (keydown or keyup) to listen for. Defaults automatically to keydown.
* @constructor
*/
BANQPAY.util.KeyListener = function(attachTo, keyData, handler, event) {
	if (! event) {
		event = BANQPAY.util.KeyListener.KEYDOWN;
	}

	var keyEvent = new BANQPAY.util.CustomEvent("keyPressed");
	
	this.enabledEvent = new BANQPAY.util.CustomEvent("enabled");
	this.disabledEvent = new BANQPAY.util.CustomEvent("disabled");

	if (typeof attachTo == 'string') {
		attachTo = document.getElementById(attachTo);
	}

	if (typeof handler == 'function') {
		keyEvent.subscribe(handler);
	} else {
		keyEvent.subscribe(handler.fn, handler.scope, handler.correctScope);
	}

	/**
	* Handles the key event when a key is pressed.
	* @private
	*/
	var handleKeyPress = function(e, obj) {
		var keyPressed = e.charCode || e.keyCode;
		
		if (! keyData.shift)	keyData.shift = false;
		if (! keyData.alt)		keyData.alt = false;
		if (! keyData.ctrl)		keyData.ctrl = false;

		// check held down modifying keys first
		if (e.shiftKey == keyData.shift && 
			e.altKey   == keyData.alt &&
			e.ctrlKey  == keyData.ctrl) { // if we pass this, all modifiers match

			if (keyData.keys instanceof Array) {
				for (var i=0;i<keyData.keys.length;i++) {
					if (keyPressed == keyData.keys[i]) {
						keyEvent.fire(keyPressed, e);
						break;
					}
				}
			} else {
				if (keyPressed == keyData.keys) {
					keyEvent.fire(keyPressed, e);
				}
			}
		}
	}

	this.enable = function() {
		if (! this.enabled) {
			BANQPAY.util.Event.addListener(attachTo, event, handleKeyPress);
			this.enabledEvent.fire(keyData);
		}
		this.enabled = true;
	}

	this.disable = function() {
		if (this.enabled) {
			BANQPAY.util.Event.removeListener(attachTo, event, handleKeyPress);
			this.disabledEvent.fire(keyData);
		}
		this.enabled = false;
	}

}

/**
* Constant representing the DOM "keydown" event.
* @final
*/
BANQPAY.util.KeyListener.KEYDOWN = "keydown";

/**
* Constant representing the DOM "keyup" event.
* @final
*/
BANQPAY.util.KeyListener.KEYUP = "keyup";

/**
* Enables the KeyListener, by dynamically attaching the key event to the appropriate DOM element.
*/
BANQPAY.util.KeyListener.prototype.enable = function() {};

/**
* Disables the KeyListener, by dynamically removing the key event from the appropriate DOM element.
*/
BANQPAY.util.KeyListener.prototype.disable = function() {};

/**
* CustomEvent fired when the KeyListener is enabled
* args: keyData
* @type BANQPAY.util.CustomEvent
*/
BANQPAY.util.KeyListener.prototype.enabledEvent = null;

/**
* CustomEvent fired when the KeyListener is disabled
* args: keyData
* @type BANQPAY.util.CustomEvent
*/
BANQPAY.util.KeyListener.prototype.disabledEvent = null;