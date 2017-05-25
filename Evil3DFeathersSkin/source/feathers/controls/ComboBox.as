/*
Feathers
Copyright 2012-2015 Bowler Hat LLC. All Rights Reserved.

This program is free software. You can redistribute and/or modify it in
accordance with the terms of the accompanying license agreement.
*/
package feathers.controls
{
	import flash.geom.Point;
	import flash.text.TextFormatAlign;
	import flash.ui.Keyboard;
	
	import away3d.events.Event;
	import away3d.events.EventDispatcher;
	
	import feathers.controls.popups.CalloutPopUpContentManager;
	import feathers.controls.popups.IPersistentPopUpContentManager;
	import feathers.controls.popups.IPopUpContentManager;
	import feathers.controls.popups.IPopUpContentManagerWithPrompt;
	import feathers.controls.popups.VerticalCenteredPopUpContentManager;
	import feathers.controls.text.Fontter;
	import feathers.core.FeathersControl;
	import feathers.core.IFocusDisplayObject;
	import feathers.core.PropertyProxy;
	import feathers.data.ListCollection;
	import feathers.events.CollectionEventType;
	import feathers.events.FeathersEventType;
	import feathers.skins.IStyleProvider;
	import feathers.system.DeviceCapabilities;
	
	import starling.core.Starling;
	import starling.display.DisplayObjectContainer;
	import starling.events.KeyboardEvent;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	/**
	 * Dispatched when the pop-up list is opened.
	 *
	 * <p>The properties of the event object have the following values:</p>
	 * <table class="innertable">
	 * <tr><th>Property</th><th>Value</th></tr>
	 * <tr><td><code>bubbles</code></td><td>false</td></tr>
	 * <tr><td><code>currentTarget</code></td><td>The Object that defines the
	 *   event listener that handles the event. For example, if you use
	 *   <code>myButton.addEventListener()</code> to register an event listener,
	 *   myButton is the value of the <code>currentTarget</code>.</td></tr>
	 * <tr><td><code>data</code></td><td>null</td></tr>
	 * <tr><td><code>target</code></td><td>The Object that dispatched the event;
	 *   it is not always the Object listening for the event. Use the
	 *   <code>currentTarget</code> property to always access the Object
	 *   listening for the event.</td></tr>
	 * </table>
	 *
	 * @eventType away3d.events.Event.OPEN
	 */
	[Event(name="open",type="away3d.events.Event")]
	
	/**
	 * Dispatched when the pop-up list is closed.
	 *
	 * <p>The properties of the event object have the following values:</p>
	 * <table class="innertable">
	 * <tr><th>Property</th><th>Value</th></tr>
	 * <tr><td><code>bubbles</code></td><td>false</td></tr>
	 * <tr><td><code>currentTarget</code></td><td>The Object that defines the
	 *   event listener that handles the event. For example, if you use
	 *   <code>myButton.addEventListener()</code> to register an event listener,
	 *   myButton is the value of the <code>currentTarget</code>.</td></tr>
	 * <tr><td><code>data</code></td><td>null</td></tr>
	 * <tr><td><code>target</code></td><td>The Object that dispatched the event;
	 *   it is not always the Object listening for the event. Use the
	 *   <code>currentTarget</code> property to always access the Object
	 *   listening for the event.</td></tr>
	 * </table>
	 *
	 * @eventType away3d.events.Event.CLOSE
	 */
	[Event(name="close",type="away3d.events.Event")]
	
	/**
	 * Dispatched when the selected item changes.
	 *
	 * <p>The properties of the event object have the following values:</p>
	 * <table class="innertable">
	 * <tr><th>Property</th><th>Value</th></tr>
	 * <tr><td><code>bubbles</code></td><td>false</td></tr>
	 * <tr><td><code>currentTarget</code></td><td>The Object that defines the
	 *   event listener that handles the event. For example, if you use
	 *   <code>myButton.addEventListener()</code> to register an event listener,
	 *   myButton is the value of the <code>currentTarget</code>.</td></tr>
	 * <tr><td><code>data</code></td><td>null</td></tr>
	 * <tr><td><code>target</code></td><td>The Object that dispatched the event;
	 *   it is not always the Object listening for the event. Use the
	 *   <code>currentTarget</code> property to always access the Object
	 *   listening for the event.</td></tr>
	 * </table>
	 *
	 * @eventType away3d.events.Event.CHANGE
	 */
	[Event(name="change",type="away3d.events.Event")]
	
	/**
	 * Displays a button that may be triggered to display a pop-up list.
	 * The list may be customized to display in different ways, such as a
	 * drop-down, in a <code>Callout</code>, or as a modal overlay.
	 *
	 * <p>The following example creates a picker list, gives it a data provider,
	 * tells the item renderer how to interpret the data, and listens for when
	 * the selection changes:</p>
	 *
	 * <listing version="3.0">
	 * var list:ComboBox = new ComboBox();
	 * 
	 * list.dataProvider = new ListCollection(
	 * [
	 *     { text: "Milk", thumbnail: textureAtlas.getTexture( "milk" ) },
	 *     { text: "Eggs", thumbnail: textureAtlas.getTexture( "eggs" ) },
	 *     { text: "Bread", thumbnail: textureAtlas.getTexture( "bread" ) },
	 *     { text: "Chicken", thumbnail: textureAtlas.getTexture( "chicken" ) },
	 * ]);
	 * 
	 * list.listProperties.itemRendererFactory = function():IListItemRenderer
	 * {
	 *     var renderer:DefaultListItemRenderer = new DefaultListItemRenderer();
	 *     renderer.labelField = "text";
	 *     renderer.iconSourceField = "thumbnail";
	 *     return renderer;
	 * };
	 * 
	 * list.addEventListener( Event.CHANGE, list_changeHandler );
	 * 
	 * this.addChild( list );</listing>
	 *
	 * @see ../../../help/picker-list.html How to use the Feathers ComboBox component
	 */
	public class ComboBox extends FeathersControl implements IFocusDisplayObject
	{
		/**
		 * @private
		 */
		protected static const INVALIDATION_FLAG_BUTTON_FACTORY:String = "buttonFactory";
		
		/**
		 * @private
		 */
		protected static const INVALIDATION_FLAG_TEXTINPUT_FACTORY:String = "textInputFactory";
		
		/**
		 * @private
		 */
		protected static const INVALIDATION_FLAG_LIST_FACTORY:String = "listFactory";
		
		/**
		 * The default value added to the <code>styleNameList</code> of the button.
		 *
		 * @see feathers.core.FeathersControl#styleNameList
		 */
		public static const DEFAULT_CHILD_STYLE_NAME_BUTTON:String = "feathers-picker-list-button";
		
		public static const DEFAULT_CHILD_STYLE_NAME_TEXTINPUT:String = "feathers-picker-list-textInput";
		
		/**
		 * The default value added to the <code>styleNameList</code> of the pop-up
		 * list.
		 *
		 * @see feathers.core.FeathersControl#styleNameList
		 */
		public static const DEFAULT_CHILD_STYLE_NAME_LIST:String = "feathers-picker-list-list";
		
		/**
		 * The default <code>IStyleProvider</code> for all <code>ComboBox</code>
		 * components.
		 *
		 * @default null
		 * @see feathers.core.FeathersControl#styleProvider
		 */
		public static var globalStyleProvider:IStyleProvider;
		
		/**
		 * @private
		 */
		protected static function defaultButtonFactory():Button
		{
			return new Button();
		}
		
		/**
		 * @private
		 */
		protected static function defaultTextInputFactory():TextInput
		{
			return new TextInput();
		}
		
		/**
		 * @private
		 */
		protected static function defaultListFactory():List
		{
			return new List();
		}
		
		private static var HELP_POINT:Point =  new Point(0,0);
		
		/**
		 * Constructor.
		 */
		public function ComboBox()
		{
			super();
		}
		
		/**
		 * The default value added to the <code>styleNameList</code> of the
		 * button. This variable is <code>protected</code> so that sub-classes
		 * can customize the button style name in their constructors instead of
		 * using the default style name defined by
		 * <code>DEFAULT_CHILD_STYLE_NAME_BUTTON</code>.
		 *
		 * <p>To customize the button style name without subclassing, see
		 * <code>customButtonStyleName</code>.</p>
		 *
		 * @see #customButtonStyleName
		 * @see feathers.core.FeathersControl#styleNameList
		 */
		protected var buttonStyleName:String = DEFAULT_CHILD_STYLE_NAME_BUTTON;
		protected var textInputStyleName:String = DEFAULT_CHILD_STYLE_NAME_TEXTINPUT;
		
		/**
		 * The default value added to the <code>styleNameList</code> of the
		 * pop-up list. This variable is <code>protected</code> so that
		 * sub-classes can customize the list style name in their constructors
		 * instead of using the default style name defined by
		 * <code>DEFAULT_CHILD_STYLE_NAME_LIST</code>.
		 *
		 * <p>To customize the pop-up list name without subclassing, see
		 * <code>customListStyleName</code>.</p>
		 *
		 * @see #customListStyleName
		 * @see feathers.core.FeathersControl#styleNameList
		 */
		protected var listStyleName:String = DEFAULT_CHILD_STYLE_NAME_LIST;
		
		/**
		 * The button sub-component.
		 *
		 * <p>For internal use in subclasses.</p>
		 *
		 * @see #buttonFactory
		 * @see #createButton()
		 */
		protected var button:Button;
		
		public function getButton():Button
		{
			return button;
		}
		
		protected var textInput:TextInput;
		
		public function getTextInput():TextInput
		{
			return textInput;
		}
		
		/**
		 * The list sub-component.
		 *
		 * <p>For internal use in subclasses.</p>
		 *
		 * @see #listFactory
		 * @see #createList()
		 */
		protected var list:List;
		
		public function getList():List
		{
			return list;
		}
		
		/**
		 * @private
		 */
		override protected function get defaultStyleProvider():IStyleProvider
		{
			return ComboBox.globalStyleProvider;
		}
		
		/**
		 * @private
		 */
		protected var _dataProvider:ListCollection;
		
		/**
		 * The collection of data displayed by the list.
		 *
		 * <p>The following example passes in a data provider and tells the item
		 * renderer how to interpret the data:</p>
		 *
		 * <listing version="3.0">
		 * list.dataProvider = new ListCollection(
		 * [
		 *     { text: "Milk", thumbnail: textureAtlas.getTexture( "milk" ) },
		 *     { text: "Eggs", thumbnail: textureAtlas.getTexture( "eggs" ) },
		 *     { text: "Bread", thumbnail: textureAtlas.getTexture( "bread" ) },
		 *     { text: "Chicken", thumbnail: textureAtlas.getTexture( "chicken" ) },
		 * ]);
		 *
		 * list.listProperties.itemRendererFactory = function():IListItemRenderer
		 * {
		 *     var renderer:DefaultListItemRenderer = new DefaultListItemRenderer();
		 *     renderer.labelField = "text";
		 *     renderer.iconSourceField = "thumbnail";
		 *     return renderer;
		 * };</listing>
		 *
		 * @default null
		 */
		public function get dataProvider():ListCollection
		{
			return this._dataProvider;
		}
		
		/**
		 * @private
		 */
		public function set dataProvider(value:ListCollection):void
		{
			if(this._dataProvider == value)
			{
				return;
			}
			var oldSelectedIndex:int = this.selectedIndex;
			var oldSelectedItem:Object = this.selectedItem;
			if(this._dataProvider)
			{
				this._dataProvider.removeEventListener(CollectionEventType.RESET, dataProvider_multipleEventHandler);
				this._dataProvider.removeEventListener(CollectionEventType.ADD_ITEM, dataProvider_multipleEventHandler);
				this._dataProvider.removeEventListener(CollectionEventType.REMOVE_ITEM, dataProvider_multipleEventHandler);
				this._dataProvider.removeEventListener(CollectionEventType.REPLACE_ITEM, dataProvider_multipleEventHandler);
			}
			this._dataProvider = value;
			if(this._dataProvider)
			{
				this._dataProvider.addEventListener(CollectionEventType.RESET, dataProvider_multipleEventHandler);
				this._dataProvider.addEventListener(CollectionEventType.ADD_ITEM, dataProvider_multipleEventHandler);
				this._dataProvider.addEventListener(CollectionEventType.REMOVE_ITEM, dataProvider_multipleEventHandler);
				this._dataProvider.addEventListener(CollectionEventType.REPLACE_ITEM, dataProvider_multipleEventHandler);
			}
			if(!this._dataProvider || this._dataProvider.length == 0)
			{
				this.selectedIndex = -1;
			}
			//不需要默认选中第一个
/*			else
			{
				this.selectedIndex = 0;
			}*/
			//this ensures that Event.CHANGE will dispatch for selectedItem
			//changing, even if selectedIndex has not changed.
			if(this.selectedIndex == oldSelectedIndex && this.selectedItem != oldSelectedItem)
			{
				this.dispatchEventWith(Event.CHANGE);
			}
			this.invalidate(INVALIDATION_FLAG_DATA);
		}
		
		/**
		 * @private
		 */
		protected var _ignoreSelectionChanges:Boolean = false;
		
		/**
		 * @private
		 */
		protected var _selectedIndex:int = -1;
		
		/**
		 * The index of the currently selected item. Returns <code>-1</code> if
		 * no item is selected.
		 *
		 * <p>The following example selects an item by its index:</p>
		 *
		 * <listing version="3.0">
		 * list.selectedIndex = 2;</listing>
		 *
		 * <p>The following example clears the selected index:</p>
		 *
		 * <listing version="3.0">
		 * list.selectedIndex = -1;</listing>
		 *
		 * <p>The following example listens for when selection changes and
		 * requests the selected index:</p>
		 *
		 * <listing version="3.0">
		 * function list_changeHandler( event:Event ):void
		 * {
		 *     var list:ComboBox = ComboBox( event.currentTarget );
		 *     var index:int = list.selectedIndex;
		 *
		 * }
		 * list.addEventListener( Event.CHANGE, list_changeHandler );</listing>
		 *
		 * @default -1
		 *
		 * @see #selectedItem
		 */
		public function get selectedIndex():int
		{
			return this._selectedIndex;
		}
		
		/**
		 * @private
		 */
		public function set selectedIndex(value:int):void
		{
			if(this._selectedIndex == value)
			{
				return;
			}
			this._selectedIndex = value;
			this.invalidate(INVALIDATION_FLAG_SELECTED);
			this.dispatchEventWith(Event.CHANGE);
		}
		
		/**
		 * The currently selected item. Returns <code>null</code> if no item is
		 * selected.
		 *
		 * <p>The following example changes the selected item:</p>
		 *
		 * <listing version="3.0">
		 * list.selectedItem = list.dataProvider.getItemAt(0);</listing>
		 *
		 * <p>The following example clears the selected item:</p>
		 *
		 * <listing version="3.0">
		 * list.selectedItem = null;</listing>
		 *
		 * <p>The following example listens for when selection changes and
		 * requests the selected item:</p>
		 *
		 * <listing version="3.0">
		 * function list_changeHandler( event:Event ):void
		 * {
		 *     var list:ComboBox = ComboBox( event.currentTarget );
		 *     var item:Object = list.selectedItem;
		 *
		 * }
		 * list.addEventListener( Event.CHANGE, list_changeHandler );</listing>
		 *
		 * @default null
		 *
		 * @see #selectedIndex
		 */
		public function get selectedItem():Object
		{
			if(!this._dataProvider || this._selectedIndex < 0 || this._selectedIndex >= this._dataProvider.length)
			{
				return null;
			}
			return this._dataProvider.getItemAt(this._selectedIndex);
		}
		
		/**
		 * @private
		 */
		public function set selectedItem(value:Object):void
		{
			if(!this._dataProvider)
			{
				this.selectedIndex = -1;
				return;
			}
			this.selectedIndex = this._dataProvider.getItemIndex(value);
		}
		
		/**
		 * @private
		 */
		protected var _prompt:String;
		
		/**
		 * Text displayed by the button sub-component when no items are
		 * currently selected.
		 *
		 * <p>In the following example, a prompt is given to the picker list
		 * and the selected item is cleared to display the prompt:</p>
		 *
		 * <listing version="3.0">
		 * list.prompt = "Select an Item";
		 * list.selectedIndex = -1;</listing>
		 *
		 * @default null
		 */
		public function get prompt():String
		{
			return this._prompt;
		}
		
		/**
		 * @private
		 */
		public function set prompt(value:String):void
		{
			if(this._prompt == value)
			{
				return;
			}
			this._prompt = value;
			this.invalidate(INVALIDATION_FLAG_SELECTED);
		}
		
		private var _maxChars:int = 0;
		
		/**
		 * 文本输入框中最多可包含的字符数（即用户输入的字符数）。0 值相当于无限制。默认值为0.
		 */		
		public function get maxChars():int
		{
			return _maxChars;
		}
		public function set maxChars(value:int):void
		{
			if (value == _maxChars)
				return;
			
			_maxChars = value;
			this.invalidate(INVALIDATION_FLAG_TEXT_EDITOR);
		}
		
		/**
		 * @private
		 */
		protected var _labelField:String = "label";
		
		/**
		 * The field in the selected item that contains the label text to be
		 * displayed by the picker list's button control. If the selected item
		 * does not have this field, and a <code>labelFunction</code> is not
		 * defined, then the picker list will default to calling
		 * <code>toString()</code> on the selected item. To omit the
		 * label completely, define a <code>labelFunction</code> that returns an
		 * empty string.
		 *
		 * <p><strong>Important:</strong> This value only affects the selected
		 * item displayed by the picker list's button control. It will <em>not</em>
		 * affect the label text of the pop-up list's item renderers.</p>
		 *
		 * <p>In the following example, the label field is changed:</p>
		 *
		 * <listing version="3.0">
		 * list.labelField = "text";</listing>
		 *
		 * @default "label"
		 *
		 * @see #labelFunction
		 */
		public function get labelField():String
		{
			return this._labelField;
		}
		
		/**
		 * @private
		 */
		public function set labelField(value:String):void
		{
			if(this._labelField == value)
			{
				return;
			}
			this._labelField = value;
			this.invalidate(INVALIDATION_FLAG_DATA);
		}
		
		/**
		 * @private
		 */
		protected var _labelFunction:Function;
		
		/**
		 * A function used to generate label text for the selected item
		 * displayed by the picker list's button control. If this
		 * function is not null, then the <code>labelField</code> will be
		 * ignored.
		 *
		 * <p><strong>Important:</strong> This value only affects the selected
		 * item displayed by the picker list's button control. It will <em>not</em>
		 * affect the label text of the pop-up list's item renderers.</p>
		 *
		 * <p>The function is expected to have the following signature:</p>
		 * <pre>function( item:Object ):String</pre>
		 *
		 * <p>All of the label fields and functions, ordered by priority:</p>
		 * <ol>
		 *     <li><code>labelFunction</code></li>
		 *     <li><code>labelField</code></li>
		 * </ol>
		 *
		 * <p>In the following example, the label field is changed:</p>
		 *
		 * <listing version="3.0">
		 * list.labelFunction = function( item:Object ):String
		 * {
		 *     return item.firstName + " " + item.lastName;
		 * };</listing>
		 *
		 * @default null
		 *
		 * @see #labelField
		 */
		public function get labelFunction():Function
		{
			return this._labelFunction;
		}
		
		/**
		 * @private
		 */
		public function set labelFunction(value:Function):void
		{
			this._labelFunction = value;
			this.invalidate(INVALIDATION_FLAG_DATA);
		}
		
		/**
		 * @private
		 */
		protected var _popUpContentManager:IPopUpContentManager;
		
		/**
		 * A manager that handles the details of how to display the pop-up list.
		 *
		 * <p>In the following example, a pop-up content manager is provided:</p>
		 *
		 * <listing version="3.0">
		 * list.popUpContentManager = new CalloutPopUpContentManager();</listing>
		 *
		 * @default null
		 */
		public function get popUpContentManager():IPopUpContentManager
		{
			return this._popUpContentManager;
		}
		
		/**
		 * @private
		 */
		public function set popUpContentManager(value:IPopUpContentManager):void
		{
			if(this._popUpContentManager == value)
			{
				return;
			}
			if(this._popUpContentManager is EventDispatcher)
			{
				var dispatcher:EventDispatcher = EventDispatcher(this._popUpContentManager);
				dispatcher.removeEventListener(Event.OPEN, popUpContentManager_openHandler);
				dispatcher.removeEventListener(Event.CLOSE, popUpContentManager_closeHandler);
			}
			this._popUpContentManager = value;
			if(this._popUpContentManager is EventDispatcher)
			{
				dispatcher = EventDispatcher(this._popUpContentManager);
				dispatcher.addEventListener(Event.OPEN, popUpContentManager_openHandler);
				dispatcher.addEventListener(Event.CLOSE, popUpContentManager_closeHandler);
			}
			this.invalidate(INVALIDATION_FLAG_STYLES);
		}
		
		/**
		 * @private
		 */
		protected var _typicalItemWidth:Number = NaN;
		
		/**
		 * @private
		 */
		protected var _typicalItemHeight:Number = NaN;
		
		/**
		 * @private
		 */
		protected var _typicalItem:Object = null;
		
		/**
		 * Used to auto-size the list. If the list's width or height is NaN, the
		 * list will try to automatically pick an ideal size. This item is
		 * used in that process to create a sample item renderer.
		 *
		 * <p>The following example provides a typical item:</p>
		 *
		 * <listing version="3.0">
		 * list.typicalItem = { text: "A typical item", thumbnail: texture };
		 * list.itemRendererProperties.labelField = "text";
		 * list.itemRendererProperties.iconSourceField = "thumbnail";</listing>
		 *
		 * @default null
		 */
		public function get typicalItem():Object
		{
			return this._typicalItem;
		}
		
		/**
		 * @private
		 */
		public function set typicalItem(value:Object):void
		{
			if(this._typicalItem == value)
			{
				return;
			}
			this._typicalItem = value;
			this._typicalItemWidth = NaN;
			this._typicalItemHeight = NaN;
			this.invalidate(INVALIDATION_FLAG_STYLES);
		}
		
		/**
		 * @private
		 */
		protected var _buttonFactory:Function;
		
		/**
		 * A function used to generate the picker list's button sub-component.
		 * The button must be an instance of <code>Button</code>. This factory
		 * can be used to change properties on the button when it is first
		 * created. For instance, if you are skinning Feathers components
		 * without a theme, you might use this factory to set skins and other
		 * styles on the button.
		 *
		 * <p>The function should have the following signature:</p>
		 * <pre>function():Button</pre>
		 *
		 * <p>In the following example, a custom button factory is passed to the
		 * picker list:</p>
		 *
		 * <listing version="3.0">
		 * list.buttonFactory = function():Button
		 * {
		 *     var button:Button = new Button();
		 *     button.defaultSkin = new Image( upTexture );
		 *     button.downSkin = new Image( downTexture );
		 *     return button;
		 * };</listing>
		 *
		 * @default null
		 *
		 * @see feathers.controls.Button
		 * @see #buttonProperties
		 */
		public function get buttonFactory():Function
		{
			return this._buttonFactory;
		}
		
		/**
		 * @private
		 */
		public function set buttonFactory(value:Function):void
		{
			if(this._buttonFactory == value)
			{
				return;
			}
			this._buttonFactory = value;
			this.invalidate(INVALIDATION_FLAG_BUTTON_FACTORY);
		}
		
		/**
		 * @private
		 */
		protected var _customButtonStyleName:String;
		
		/**
		 * A style name to add to the picker list's button sub-component.
		 * Typically used by a theme to provide different styles to different
		 * picker lists.
		 *
		 * <p>In the following example, a custom button style name is passed to
		 * the picker list:</p>
		 *
		 * <listing version="3.0">
		 * list.customButtonStyleName = "my-custom-button";</listing>
		 *
		 * <p>In your theme, you can target this sub-component style name to
		 * provide different styles than the default:</p>
		 *
		 * <listing version="3.0">
		 * getStyleProviderForClass( Button ).setFunctionForStyleName( "my-custom-button", setCustomButtonStyles );</listing>
		 *
		 * @default null
		 *
		 * @see #DEFAULT_CHILD_STYLE_NAME_BUTTON
		 * @see feathers.core.FeathersControl#styleNameList
		 * @see #buttonFactory
		 * @see #buttonProperties
		 */
		public function get customButtonStyleName():String
		{
			return this._customButtonStyleName;
		}
		
		/**
		 * @private
		 */
		public function set customButtonStyleName(value:String):void
		{
			if(this._customButtonStyleName == value)
			{
				return;
			}
			this._customButtonStyleName = value;
			this.invalidate(INVALIDATION_FLAG_BUTTON_FACTORY);
		}
		
		/**
		 * @private
		 */
		protected var _buttonProperties:PropertyProxy;
		
		/**
		 * An object that stores properties for the picker's button
		 * sub-component, and the properties will be passed down to the button
		 * when the picker validates. For a list of available
		 * properties, refer to
		 * <a href="Button.html"><code>feathers.controls.Button</code></a>.
		 *
		 * <p>If the subcomponent has its own subcomponents, their properties
		 * can be set too, using attribute <code>&#64;</code> notation. For example,
		 * to set the skin on the thumb which is in a <code>SimpleScrollBar</code>,
		 * which is in a <code>List</code>, you can use the following syntax:</p>
		 * <pre>list.verticalScrollBarProperties.&#64;thumbProperties.defaultSkin = new Image(texture);</pre>
		 *
		 * <p>Setting properties in a <code>buttonFactory</code> function
		 * instead of using <code>buttonProperties</code> will result in better
		 * performance.</p>
		 *
		 * <p>In the following example, the button properties are passed to the
		 * picker list:</p>
		 *
		 * <listing version="3.0">
		 * list.buttonProperties.defaultSkin = new Image( upTexture );
		 * list.buttonProperties.downSkin = new Image( downTexture );</listing>
		 *
		 * @default null
		 *
		 * @see #buttonFactory
		 * @see feathers.controls.Button
		 */
		public function get buttonProperties():Object
		{
			if(!this._buttonProperties)
			{
				this._buttonProperties = new PropertyProxy(childProperties_onChange);
			}
			return this._buttonProperties;
		}
		
		/**
		 * @private
		 */
		public function set buttonProperties(value:Object):void
		{
			if(this._buttonProperties == value)
			{
				return;
			}
			if(!value)
			{
				value = new PropertyProxy();
			}
			if(!(value is PropertyProxy))
			{
				var newValue:PropertyProxy = new PropertyProxy();
				for(var propertyName:String in value)
				{
					newValue[propertyName] = value[propertyName];
				}
				value = newValue;
			}
			if(this._buttonProperties)
			{
				this._buttonProperties.removeOnChangeCallback(childProperties_onChange);
			}
			this._buttonProperties = PropertyProxy(value);
			if(this._buttonProperties)
			{
				this._buttonProperties.addOnChangeCallback(childProperties_onChange);
			}
			this.invalidate(INVALIDATION_FLAG_STYLES);
		}
		
		/**
		 * @private
		 */
		protected var _textInputFactory:Function;
		public function get textInputFactory():Function
		{
			return this._textInputFactory;
		}
		
		/**
		 * @private
		 */
		public function set textInputFactory(value:Function):void
		{
			if(this._textInputFactory == value)
			{
				return;
			}
			this._textInputFactory = value;
			this.invalidate(INVALIDATION_FLAG_TEXTINPUT_FACTORY);
		}
		
		protected var _customTextInputStyleName:String;
		
		public function get customTextInputStyleName():String
		{
			return this._customTextInputStyleName;
		}
		
		public function set customTextInputStyleName(value:String):void
		{
			if(this._customTextInputStyleName == value)
			{
				return;
			}
			this._customTextInputStyleName = value;
			this.invalidate(INVALIDATION_FLAG_TEXTINPUT_FACTORY);
		}
		
		protected var _textInputProperties:PropertyProxy;
		
		public function get textInputProperties():Object
		{
			if(!this._textInputProperties)
			{
				this._textInputProperties = new PropertyProxy(childProperties_onChange);
			}
			return this._textInputProperties;
		}
		
		public function set textInputProperties(value:Object):void
		{
			if(this._textInputProperties == value)
			{
				return;
			}
			if(!value)
			{
				value = new PropertyProxy();
			}
			if(!(value is PropertyProxy))
			{
				var newValue:PropertyProxy = new PropertyProxy();
				for(var propertyName:String in value)
				{
					newValue[propertyName] = value[propertyName];
				}
				value = newValue;
			}
			if(this._textInputProperties)
			{
				this._textInputProperties.removeOnChangeCallback(childProperties_onChange);
			}
			this._textInputProperties = PropertyProxy(value);
			if(this._textInputProperties)
			{
				this._textInputProperties.addOnChangeCallback(childProperties_onChange);
			}
			this.invalidate(INVALIDATION_FLAG_STYLES);
		}
		
		protected var _valueParseFunction:Function;
		
		public function get valueParseFunction():Function
		{
			return this._valueParseFunction;
		}
		
		public function set valueParseFunction(value:Function):void
		{
			this._valueParseFunction = value;
		}
		
		/**
		 * @private
		 */
		protected var _listFactory:Function;
		
		/**
		 * A function used to generate the picker list's pop-up list
		 * sub-component. The list must be an instance of <code>List</code>.
		 * This factory can be used to change properties on the list when it is
		 * first created. For instance, if you are skinning Feathers components
		 * without a theme, you might use this factory to set skins and other
		 * styles on the list.
		 *
		 * <p>The function should have the following signature:</p>
		 * <pre>function():List</pre>
		 *
		 * <p>In the following example, a custom list factory is passed to the
		 * picker list:</p>
		 *
		 * <listing version="3.0">
		 * list.listFactory = function():List
		 * {
		 *     var popUpList:List = new List();
		 *     popUpList.backgroundSkin = new Image( texture );
		 *     return popUpList;
		 * };</listing>
		 *
		 * @default null
		 *
		 * @see feathers.controls.List
		 * @see #listProperties
		 */
		public function get listFactory():Function
		{
			return this._listFactory;
		}
		
		/**
		 * @private
		 */
		public function set listFactory(value:Function):void
		{
			if(this._listFactory == value)
			{
				return;
			}
			this._listFactory = value;
			this.invalidate(INVALIDATION_FLAG_LIST_FACTORY);
		}
		
		/**
		 * @private
		 */
		protected var _customListStyleName:String;
		
		/**
		 * A style name to add to the picker list's list sub-component.
		 * Typically used by a theme to provide different styles to different
		 * picker lists.
		 *
		 * <p>In the following example, a custom list style name is passed to the
		 * picker list:</p>
		 *
		 * <listing version="3.0">
		 * list.customListStyleName = "my-custom-list";</listing>
		 *
		 * <p>In your theme, you can target this sub-component style name to provide
		 * different styles than the default:</p>
		 *
		 * <listing version="3.0">
		 * getStyleProviderForClass( List ).setFunctionForStyleName( "my-custom-list", setCustomListStyles );</listing>
		 *
		 * @default null
		 *
		 * @see #DEFAULT_CHILD_STYLE_NAME_LIST
		 * @see feathers.core.FeathersControl#styleNameList
		 * @see #listFactory
		 * @see #listProperties
		 */
		public function get customListStyleName():String
		{
			return this._customListStyleName;
		}
		
		/**
		 * @private
		 */
		public function set customListStyleName(value:String):void
		{
			if(this._customListStyleName == value)
			{
				return;
			}
			this._customListStyleName = value;
			this.invalidate(INVALIDATION_FLAG_LIST_FACTORY);
		}
		
		/**
		 * @private
		 */
		protected var _listProperties:PropertyProxy;
		
		/**
		 * An object that stores properties for the picker's pop-up list
		 * sub-component, and the properties will be passed down to the pop-up
		 * list when the picker validates. For a list of available
		 * properties, refer to
		 * <a href="List.html"><code>feathers.controls.List</code></a>.
		 *
		 * <p>If the subcomponent has its own subcomponents, their properties
		 * can be set too, using attribute <code>&#64;</code> notation. For example,
		 * to set the skin on the thumb which is in a <code>SimpleScrollBar</code>,
		 * which is in a <code>List</code>, you can use the following syntax:</p>
		 * <pre>list.verticalScrollBarProperties.&#64;thumbProperties.defaultSkin = new Image(texture);</pre>
		 *
		 * <p>Setting properties in a <code>listFactory</code> function
		 * instead of using <code>listProperties</code> will result in better
		 * performance.</p>
		 *
		 * <p>In the following example, the list properties are passed to the
		 * picker list:</p>
		 *
		 * <listing version="3.0">
		 * list.listProperties.backgroundSkin = new Image( texture );</listing>
		 *
		 * @default null
		 *
		 * @see #listFactory
		 * @see feathers.controls.List
		 */
		public function get listProperties():Object
		{
			if(!this._listProperties)
			{
				this._listProperties = new PropertyProxy(childProperties_onChange);
			}
			return this._listProperties;
		}
		
		/**
		 * @private
		 */
		public function set listProperties(value:Object):void
		{
			if(this._listProperties == value)
			{
				return;
			}
			if(!value)
			{
				value = new PropertyProxy();
			}
			if(!(value is PropertyProxy))
			{
				var newValue:PropertyProxy = new PropertyProxy();
				for(var propertyName:String in value)
				{
					newValue[propertyName] = value[propertyName];
				}
				value = newValue;
			}
			if(this._listProperties)
			{
				this._listProperties.removeOnChangeCallback(childProperties_onChange);
			}
			this._listProperties = PropertyProxy(value);
			if(this._listProperties)
			{
				this._listProperties.addOnChangeCallback(childProperties_onChange);
			}
			this.invalidate(INVALIDATION_FLAG_STYLES);
		}
		
		/**
		 * @inheritDoc
		 */
		public function get baseline():Number
		{
			if(!this.button)
			{
				return this.scaledActualHeight;
			}
			return this.scaleY * (this.button.y + this.button.baseline);
		}
		
		/**
		 * @private
		 */
		protected var _triggered:Boolean = false;
		/**
		 * @private
		 */
		protected var _isOpenListPending:Boolean = false;
		
		/**
		 * @private
		 */
		protected var _isCloseListPending:Boolean = false;
		
		/**
		 * Using <code>labelField</code> and <code>labelFunction</code>,
		 * generates a label from the selected item to be displayed by the
		 * picker list's button control.
		 *
		 * <p><strong>Important:</strong> This value only affects the selected
		 * item displayed by the picker list's button control. It will <em>not</em>
		 * affect the label text of the pop-up list's item renderers.</p>
		 */
		public function itemToLabel(item:Object):String
		{
			if(this._labelFunction != null)
			{
				var labelResult:Object = this._labelFunction(item);
				if(labelResult is String)
				{
					return labelResult as String;
				}
				return labelResult.toString();
			}
			else if(this._labelField != null && item && item.hasOwnProperty(this._labelField))
			{
				labelResult = item[this._labelField];
				if(labelResult is String)
				{
					return labelResult as String;
				}
				return labelResult.toString();
			}
			else if(item is String)
			{
				return item as String;
			}
			else if(item)
			{
				return item.toString();
			}
			return "";
		}
		
		/**
		 * @private
		 */
		protected var _buttonHasFocus:Boolean = false;
		
		/**
		 * @private
		 */
		protected var _buttonTouchPointID:int = -1;
		
		/**
		 * @private
		 */
		protected var _listIsOpenOnTouchBegan:Boolean = false;
		
		/**
		 * Opens the pop-up list, if it isn't already open.
		 */
		public function openList():void
		{
			this._isCloseListPending = false;
			if(this._popUpContentManager.isOpen)
			{
				return;
			}
			if(!this._isValidating && this.isInvalid())
			{
				this._isOpenListPending = true;
				return;
			}
			this._isOpenListPending = false;
			if(this._popUpContentManager is IPopUpContentManagerWithPrompt)
			{
				IPopUpContentManagerWithPrompt(this._popUpContentManager).prompt = this._prompt;
			}
			this._popUpContentManager.open(this.list, this);
			this.list.scrollToDisplayIndex(this._selectedIndex);
			this.list.validate();
			if(this._focusManager)
			{
				this._focusManager.focus = this.list;
				this.stage.addEventListener(KeyboardEvent.KEY_UP, stage_keyUpHandler);
			}
		}
		
		/**
		 * Closes the pop-up list, if it is open.
		 */
		public function closeList():void
		{
			this._isOpenListPending = false;
			if(!this._popUpContentManager.isOpen)
			{
				return;
			}
			if(!this._isValidating && this.isInvalid())
			{
				this._isCloseListPending = true;
				return;
			}
			this._isCloseListPending = false;
			this.list.validate();
			//don't clean up anything from openList() in closeList(). The list
			//may be closed by removing it from the PopUpManager, which would
			//result in closeList() never being called.
			//instead, clean up in the Event.REMOVED_FROM_STAGE listener.
			this._popUpContentManager.close();
		}
		
		/**
		 * @inheritDoc
		 */
		override public function dispose():void
		{
			if(this.list)
			{
				this.closeList();
				this.list.dispose();
				this.list = null;
			}
			if(this._popUpContentManager)
			{
				this._popUpContentManager.dispose();
				this._popUpContentManager = null;
			}
			//clearing selection now so that the data provider setter won't
			//cause a selection change that triggers events.
			this._selectedIndex = -1;
			this.dataProvider = null;
			super.dispose();
		}
		
		/**
		 * @private
		 */
		override protected function initialize():void
		{
			if(!this._popUpContentManager)
			{
				if(DeviceCapabilities.isTablet(Starling.current.nativeStage))
				{
					this.popUpContentManager = new CalloutPopUpContentManager();
				}
				else
				{
					this.popUpContentManager = new VerticalCenteredPopUpContentManager();
				}
			}
		}
		
		/**
		 * @private
		 */
		override protected function draw():void
		{
			var dataInvalid:Boolean = this.isInvalid(INVALIDATION_FLAG_DATA);
			var stylesInvalid:Boolean = this.isInvalid(INVALIDATION_FLAG_STYLES);
			var stateInvalid:Boolean = this.isInvalid(INVALIDATION_FLAG_STATE);
			var selectionInvalid:Boolean = this.isInvalid(INVALIDATION_FLAG_SELECTED);
			var sizeInvalid:Boolean = this.isInvalid(INVALIDATION_FLAG_SIZE);
			var buttonFactoryInvalid:Boolean = this.isInvalid(INVALIDATION_FLAG_BUTTON_FACTORY);
			var textInputFactoryInvalid:Boolean = this.isInvalid(INVALIDATION_FLAG_TEXTINPUT_FACTORY);
			var listFactoryInvalid:Boolean = this.isInvalid(INVALIDATION_FLAG_LIST_FACTORY);
			var textInputEditorInvalid:Boolean = this.isInvalid(INVALIDATION_FLAG_TEXT_EDITOR);
	
			if(textInputFactoryInvalid)
			{
				this.createTextInput();
			}
			
			if(buttonFactoryInvalid)
			{
				this.createButton();
			}
			
			if(listFactoryInvalid)
			{
				this.createList();
			}
			
			if(buttonFactoryInvalid || textInputFactoryInvalid || stylesInvalid || selectionInvalid)
			{
				//this section asks the button to auto-size again, if our
				//explicit dimensions aren't set.
				//set this before buttonProperties is used because it might
				//contain width or height changes.
				if(this.explicitWidth !== this.explicitWidth) //isNaN
				{
					this.button.width = NaN;
				}
				if(this.explicitHeight !== this.explicitHeight) //isNaN
				{
					this.button.height = NaN;
				}
			}
			
			if(buttonFactoryInvalid || textInputFactoryInvalid || stylesInvalid)
			{
				this._typicalItemWidth = NaN;
				this._typicalItemHeight = NaN;
				this.refreshButtonProperties();
			}
			
			if(listFactoryInvalid || stylesInvalid)
			{
				this.refreshListProperties();
			}
			
			if(listFactoryInvalid || dataInvalid)
			{
				var oldIgnoreSelectionChanges:Boolean = this._ignoreSelectionChanges;
				this._ignoreSelectionChanges = true;
				this.list.dataProvider = this._dataProvider;
				this._ignoreSelectionChanges = oldIgnoreSelectionChanges;
			}
			
			if(buttonFactoryInvalid || textInputFactoryInvalid || listFactoryInvalid || stateInvalid)
			{
				this.button.isEnabled = this._isEnabled;
				this.list.isEnabled = this._isEnabled;
			}
			
			if(buttonFactoryInvalid ||textInputEditorInvalid || textInputFactoryInvalid || dataInvalid || selectionInvalid)
			{
				this.refreshTextInput();
			}
			if(listFactoryInvalid || dataInvalid || selectionInvalid)
			{
				oldIgnoreSelectionChanges = this._ignoreSelectionChanges;
				this._ignoreSelectionChanges = true;
				this.list.selectedIndex = this._selectedIndex;
				this._ignoreSelectionChanges = oldIgnoreSelectionChanges;
			}
			
			//sizeInvalid = this.autoSizeIfNeeded() || sizeInvalid;
			
			if(buttonFactoryInvalid || textInputFactoryInvalid || stylesInvalid || sizeInvalid || selectionInvalid)
			{
				this.layout();
			}
			
			//final validation to avoid juggler next frame issues
			//also, to ensure that property changes on the pop-up list are fully
			//committed
			this.list.validate();
			this.textInput.validate();
			
			this.handlePendingActions();
		}
		
		/**
		 * If the component's dimensions have not been set explicitly, it will
		 * measure its content and determine an ideal size for itself. If the
		 * <code>explicitWidth</code> or <code>explicitHeight</code> member
		 * variables are set, those value will be used without additional
		 * measurement. If one is set, but not the other, the dimension with the
		 * explicit value will not be measured, but the other non-explicit
		 * dimension will still need measurement.
		 *
		 * <p>Calls <code>setSizeInternal()</code> to set up the
		 * <code>actualWidth</code> and <code>actualHeight</code> member
		 * variables used for layout.</p>
		 *
		 * <p>Meant for internal use, and subclasses may override this function
		 * with a custom implementation.</p>
		 */
/*		protected function autoSizeIfNeeded():Boolean
		{
			var needsWidth:Boolean = this.explicitWidth !== this.explicitWidth; //isNaN
			var needsHeight:Boolean = this.explicitHeight !== this.explicitHeight; //isNaN
			if(!needsWidth && !needsHeight)
			{
				return false;
			}
			
			var totalWidth:Number;
			var totalHeight:Number;
			if(this._typicalItem)
			{
				if(this._typicalItemWidth !== this._typicalItemWidth || //isNaN
					this._typicalItemHeight !== this._typicalItemHeight) //isNaN
				{
					var oldWidth:Number = this.button.width;
					var oldHeight:Number = this.button.height;
					this.button.width = NaN;
					this.button.height = NaN;
					if(this._typicalItem)
					{
						this.button.label = this.itemToLabel(this._typicalItem);
					}
					this.button.validate();
					this._typicalItemWidth = this.button.width;
					this._typicalItemHeight = this.button.height;
					this.refreshTextInput();
					this.button.width = oldWidth;
					this.button.height = oldHeight;
				}
				totalWidth = this._typicalItemWidth;
				totalHeight = this._typicalItemHeight;
			}
			else
			{
				this.button.validate();
				this.textInput.validate();
				this.button.x = this.textInput.x + this.textInput.width;
				totalWidth = this.button.width + this.textInput.width;
				totalHeight = this.button.height;
			}
			
			var newWidth:Number = this.explicitWidth;
			var newHeight:Number = this.explicitHeight;
			if(needsWidth)
			{
				if(totalWidth === totalWidth) //!isNaN
				{
					newWidth = totalWidth;
				}
				else
				{
					newWidth = 0;
				}
			}
			if(needsHeight)
			{
				if(totalHeight === totalHeight) //!isNaN
				{
					newHeight = totalHeight;
				}
				else
				{
					newHeight = 0;
				}
			}
			
			return this.setSizeInternal(newWidth, newHeight, false);
		}*/
		
		/**
		 * Creates and adds the <code>button</code> sub-component and
		 * removes the old instance, if one exists.
		 *
		 * <p>Meant for internal use, and subclasses may override this function
		 * with a custom implementation.</p>
		 *
		 * @see #button
		 * @see #buttonFactory
		 * @see #customButtonStyleName
		 */
		protected function createButton():void
		{
			if(this.button)
			{
				this.button.removeFromParent(true);
				this.button = null;
			}
			
			var factory:Function = this._buttonFactory != null ? this._buttonFactory : defaultButtonFactory;
			var buttonStyleName:String = this._customButtonStyleName != null ? this._customButtonStyleName : this.buttonStyleName;
			this.button = Button(factory());
			if(this.button is ToggleButton)
			{
				//we'll control the value of isSelected manually
				ToggleButton(this.button).isToggle = false;
			}
			this.button.styleNameList.add(buttonStyleName);
			this.button.addEventListener(TouchEvent.TOUCH, button_touchHandler);
			this.button.addEventListener(Event.TRIGGERED, button_triggeredHandler);
			this.addChild(this.button);
		}
		
		protected function createTextInput():void
		{
			if(this.textInput)
			{
				this.textInput.removeFromParent(true);
				this.textInput = null;
			}
			
			var factory:Function = this._textInputFactory != null ? this._textInputFactory : defaultTextInputFactory;
			var textInputStyleName:String = this._customTextInputStyleName != null ? this._customTextInputStyleName : this.textInputStyleName;
			this.textInput = TextInput(factory());
			this.textInput.isEditable=true;
			this.textInput.styleNameList.add(textInputStyleName);
			this.textInput.isFocusEnabled = !this._focusManager;
			this.textInput.addEventListener(FeathersEventType.ENTER, textInput_enterHandler);
			this.textInput.addEventListener(FeathersEventType.TEXT_INPUT, textEditor_textInputHandler);
			this.textInput.addEventListener(FeathersEventType.FOCUS_OUT, textInput_focusOutHandler);
			this.textInput.addEventListener(Event.CHANGE, textInput_chang);
			this.addChild(this.textInput);
		}
		
		/**
		 * Creates and adds the <code>list</code> sub-component and
		 * removes the old instance, if one exists.
		 *
		 * <p>Meant for internal use, and subclasses may override this function
		 * with a custom implementation.</p>
		 *
		 * @see #list
		 * @see #listFactory
		 * @see #customListStyleName
		 */
		protected function createList():void
		{
			if(this.list)
			{
				this.list.removeFromParent(false);
				//disposing separately because the list may not have a parent
				this.list.dispose();
				this.list = null;
			}
			
			var factory:Function = this._listFactory != null ? this._listFactory : defaultListFactory;
			var listStyleName:String = this._customListStyleName != null ? this._customListStyleName : this.listStyleName;
			this.list = List(factory());
			this.list.focusOwner = this;
			this.list.styleNameList.add(listStyleName);
			this.list.itemRendererProperties.width = this.width;
			this.list.addEventListener(Event.CHANGE, list_changeHandler);
			this.list.addEventListener(Event.REMOVED_FROM_STAGE, list_removedFromStageHandler);
		}
		
		/**
		 * @private
		 */
		protected function refreshTextInput():void
		{
			if(this._selectedIndex >= 0)
			{
				this.textInput.text = this.itemToLabel(this.selectedItem);
			}
			else if(!this.textInput.text)
			{
				this.textInput.text = this._prompt;
			}
			this.textInput.nativeFilters = this.nativeFilters;
			this.textInput.maxChars = _maxChars;
			this.textInput.isEditable = _isEditable;
			this.textInput.isEnabled = _isEnabled;
			this.textInput.isSelectable = _isEditable;
			
			applyCacheTextInputTextFormat();
		}
		
		/**
		 * @private
		 */
		protected function refreshButtonProperties():void
		{
			for(var propertyName:String in this._buttonProperties)
			{
				var propertyValue:Object = this._buttonProperties[propertyName];
				this.button[propertyName] = propertyValue;
			}
		}
		
		/**
		 * @private
		 */
		protected function refreshListProperties():void
		{
			for(var propertyName:String in this._listProperties)
			{
				var propertyValue:Object = this._listProperties[propertyName];
				this.list[propertyName] = propertyValue;
			}
		}
		
		/**
		 * @private
		 */
		protected function layout():void
		{
/*			this.button.width = this.actualWidth;
			this.button.height = this.actualHeight;*/
			
			//final validation to avoid juggler next frame issues
			this.button.validate();
		}
		
		/**
		 * @private
		 */
		protected function handlePendingActions():void
		{
			if(this._isOpenListPending)
			{
				this.openList();
			}
			if(this._isCloseListPending)
			{
				this.closeList();
			}
		}
		
		/**
		 * @private
		 */
		protected function childProperties_onChange(proxy:PropertyProxy, name:String):void
		{
			this.invalidate(INVALIDATION_FLAG_STYLES);
		}
		
		/**
		 * @private
		 */
		protected function button_touchHandler(event:TouchEvent):void
		{
			if(this._buttonTouchPointID >= 0)
			{
				var touch:Touch = event.getTouch(this.button, TouchPhase.ENDED, this._buttonTouchPointID);
				if(!touch)
				{
					return;
				}
				this._buttonTouchPointID = -1;
				//the button will dispatch Event.TRIGGERED before this touch
				//listener is called, so it is safe to clear this flag.
				//we're clearing it because Event.TRIGGERED may also be
				//dispatched after keyboard input.
				this._listIsOpenOnTouchBegan = false;
			}
			else
			{
				touch = event.getTouch(this.button, TouchPhase.BEGAN);
				if(!touch)
				{
					return;
				}
				this._buttonTouchPointID = touch.id;
				this._listIsOpenOnTouchBegan = this._popUpContentManager.isOpen;
			}
		}
		
		/**
		 * @private
		 */
		protected function button_triggeredHandler(event:Event):void
		{
			if(this._focusManager && this._listIsOpenOnTouchBegan)
			{
				return;
			}
			if(this._popUpContentManager.isOpen)
			{
				this.closeList();
				return;
			}
			this.openList();
		}
		
		override public function showFocus() : void
		{
			if (!this.textInput)
			{
				return;
			}
			this.textInput.showFocus();
			return;
		}// end function
		
		override public function hideFocus() : void
		{
			if (!this.textInput)
			{
				return;
			}
			this.textInput.hideFocus();
			return;
		}// end function
		
		/**
		 * @private
		 */
		override protected function focusInHandler(event:Event):void
		{
			super.focusInHandler(event);
			
			var isInBounds:Boolean = false;
			HELP_POINT.x = Starling.current.nativeStage.mouseX;
			HELP_POINT.y = Starling.current.nativeStage.mouseY;
			isInBounds = DisplayObjectContainer(this.textInput).contains(this.stage.hitTest(HELP_POINT));
			
			if(this.textInput.isEditable && isInBounds)
			{
				this.textInput.setFocus();
				this.textInput.selectRange(0, this.textInput.text.length);
			}else if(!this.textInput.isEditable && isInBounds)
			{
				openList();
			}
			Starling.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, stage_keyDownHandler);
		}
		
		/**
		 * @private
		 */
		override protected function focusOutHandler(event:Event):void
		{
			super.focusOutHandler(event);
			this.textInput.clearFocus();
			Starling.current.stage.removeEventListener(KeyboardEvent.KEY_DOWN, stage_keyDownHandler);
		}
		
		/**
		 * @private
		 */
		protected function textEditor_textInputHandler(event:Event):void
		{
			this.list.selectedIndex = -1;
			dispatchEvent(event);
		}
		
		/**
		 * @private
		 */
		protected function textInput_enterHandler(event:Event):void
		{
			this.parseTextInputValue();
		}
		
		protected function textInput_chang(event:Event):void
		{
			this.dispatchEvent(event);
		}
		
		/**
		 * @private
		 */
		protected function textInput_focusOutHandler(event:Event):void
		{
			this.parseTextInputValue();
		}
		
		/**
		 * @private
		 */
		protected function parseTextInputValue():void
		{
			if(this._valueParseFunction != null)
			{
				var newValue:String = this._valueParseFunction(this.textInput.text);
				this.textInput.text = newValue;
				this.invalidate(INVALIDATION_FLAG_DATA);
			}
		}
		
		/**
		 * @private
		 */
		protected function stage_keyDownHandler(event:KeyboardEvent):void
		{
			if(event.keyCode == Keyboard.HOME)
			{
				//prevent default so that text input selection doesn't change
				event.preventDefault();
//				this.toMinimum();
			}
			else if(event.keyCode == Keyboard.END)
			{
				//prevent default so that text input selection doesn't change
				event.preventDefault();
//				this.toMaximum();
			}
			else if(event.keyCode == Keyboard.UP)
			{
				//prevent default so that text input selection doesn't change
				event.preventDefault();
//				this.increment();
			}
			else if(event.keyCode == Keyboard.DOWN)
			{
				//prevent default so that text input selection doesn't change
				event.preventDefault();
//				this.decrement();
			}
		}
		
		/**
		 * @private
		 */
		protected function list_changeHandler(event:Event):void
		{
			this.closeList();
			if(this._ignoreSelectionChanges ||
				this._popUpContentManager is IPersistentPopUpContentManager)
			{
				return;
			}
			this.selectedIndex = this.list.selectedIndex;
		}
		
		/**
		 * @private
		 */
		protected function popUpContentManager_openHandler(event:Event):void
		{
			this.dispatchEventWith(Event.OPEN);
		}
		
		/**
		 * @private
		 */
		protected function popUpContentManager_closeHandler(event:Event):void
		{
			if(this._popUpContentManager is IPersistentPopUpContentManager)
			{
				this.selectedIndex = this.list.selectedIndex;
			}
			this.dispatchEventWith(Event.CLOSE);
		}
		
		/**
		 * @private
		 */
		protected function list_removedFromStageHandler(event:Event):void
		{
			if(this._focusManager)
			{
				this.list.stage.removeEventListener(KeyboardEvent.KEY_UP, stage_keyUpHandler);
			}
		}
		
		
		/**
		 * @private
		 */
		protected function dataProvider_multipleEventHandler():void
		{
			//we need to ensure that the pop-up list has received the new
			//selected index, or it might update the selected index to an
			//incorrect value after an item is added, removed, or replaced.
			this.validate();
		}
		
		/**
		 * @private
		 */
		protected function stage_keyUpHandler(event:KeyboardEvent):void
		{
			if(!this._popUpContentManager.isOpen)
			{
				return;
			}
			if(event.keyCode == Keyboard.ENTER)
			{
				this.closeList();
			}
		}
		
		/**
		 * @private
		 */
		override public function set isEnabled(value:Boolean):void
		{
			if(this._isEnabled == value)
			{
				return;
			}
			this._isEnabled = value;
			
			this.invalidate(INVALIDATION_FLAG_STATE);
		}
		
		
		/**
		 * @private
		 */
		private var _isEditable:Boolean = true;
		public function set isEditable(value:Boolean):void
		{
			if(this._isEditable == value)
			{
				return;
			}
			this._isEditable = value;
			if(textInput)
			{
				textInput.isEditable = value;
				textInput.isSelectable = value;
			}
		}
		
		public function get isEditable():Boolean
		{
			return _isEditable;
		}
		
		//=============================textInput textFormat properties===========================
		//
		protected var mFontName:String = Fontter.DEFAULT_FONT_NAME;
		/** The name of the font (true type or bitmap font). */
		public function get fontName():String { return mFontName; }
		public function set fontName(value:String):void
		{
				mFontName = value;
				setTextFormatProperty("fontName", mFontName);
		}
		
		protected var mFontSize:int = Fontter.DEFAULT_FONT_SIZE;
		/** The size of the font. For bitmap fonts, use <code>BitmapFont.NATIVE_SIZE</code> for 
		 *  the original size. */
		public function get fontSize():Number { return mFontSize; }
		public function set fontSize(value:Number):void
		{
			mFontSize = value;
			setTextFormatProperty("fontSize", mFontSize);
		}
		
		private var mTextAlign:String = TextFormatAlign.LEFT;
		public function get textAlign():String
		{
			return mTextAlign;
		}
		
		public function set textAlign(value:String):void
		{
			mTextAlign = value;
			setTextFormatProperty("textAlign", mTextAlign);
		}
		
		protected var mColor:uint = Fontter.DEFAULT_FONT_COLOR;
		/** The color of the text. Note that bitmap fonts should be exported in plain white so
		 *  that tinting works correctly. If your bitmap font contains colors, set this property
		 *  to <code>Color.WHITE</code> to get the desired result. @default black */
		public function get color():uint { return mColor; }
		public function set color(value:uint):void
		{
			mColor = value;
			setTextFormatProperty("color", mColor);
		}
		
		/**
		 * @private
		 */
		protected var mBold:Boolean = false;
		/** Indicates whether the text is bold. @default false */
		public function get bold():Boolean { return mBold; }
		public function set bold(value:Boolean):void 
		{
			mBold = value;
			setTextFormatProperty("bold", mBold);
		}
		
		protected var mItalic:Boolean = false;
		/** Indicates whether the text is italicized. @default false */
		public function get italic():Boolean { return mItalic; }
		public function set italic(value:Boolean):void
		{
			mItalic = value;
			setTextFormatProperty("italic", mItalic);
		}
		
		protected var mUnderline:Boolean = false;
		/** Indicates whether the text is underlined. @default false */
		public function get underline():Boolean { return mUnderline; }
		public function set underline(value:Boolean):void
		{
			mUnderline = value;
			setTextFormatProperty("underline", mUnderline);
		}
		
		protected var mKerning:Boolean = false;
		/** Indicates whether kerning is enabled. @default true */
		public function get kerning():Boolean { return mKerning; }
		public function set kerning(value:Boolean):void
		{
			mKerning = value;
			setTextFormatProperty("kerning",mKerning);
		}
		
		protected var mLetterSpacing:Number = 0;
		/** Indicates whether kerning is enabled. @default 0 */
		public function get letterSpacing():Number { return mLetterSpacing; }
		public function set letterSpacing(value:Number):void
		{
			mLetterSpacing = value;
			setTextFormatProperty("letterSpacing",mLetterSpacing);
		}
		
		private var mLeading:Number;
		/** The amount of vertical space (called 'leading') between lines. @default 0 */
		public function get leading():Number { return mLeading; }
		public function set leading(value:Number):void
		{
			mLeading = value;
			setTextFormatProperty("leading", mLeading);
		}
		
		private var _textFormatCacheProperties:Object;
		public function setTextFormatProperty(name:String, value:*):void
		{
			if(!_textFormatCacheProperties)
			{
				_textFormatCacheProperties = {};
			}
			_textFormatCacheProperties[name] = value;
			this.invalidate(INVALIDATION_FLAG_TEXT_EDITOR);
		}
		
		private function applyCacheTextInputTextFormat():void
		{
			if(_textFormatCacheProperties != null)
			{
				for(var prop:String in _textFormatCacheProperties)
				{
					textInput.setTextFormatProperty(prop, _textFormatCacheProperties[prop]);
				}
				_textFormatCacheProperties = null;
			}
		}

		/**
		 * @private
		 */
		protected var _nativeFilters:Array;
		
		/**
		 * Native filters to pass to the <code>flash.text.TextField</code>
		 * before creating the texture snapshot.
		 *
		 * <p>In the following example, the native filters are changed:</p>
		 *
		 * <listing version="3.0">
		 * renderer.nativeFilters = [ new GlowFilter() ];</listing>
		 *
		 * @default null
		 *
		 * @see http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/flash/display/DisplayObject.html#filters Full description of flash.display.DisplayObject.filters in Adobe's Flash Platform API Reference
		 */
		public function get nativeFilters():Array
		{
			return this._nativeFilters;
		}
		
		/**
		 * @private
		 */
		public function set nativeFilters(value:Array):void
		{
			if(this._nativeFilters == value)
			{
				return;
			}
			this._nativeFilters = value;
			this.textInputProperties["nativeFilters"] = value;
			this.invalidate(INVALIDATION_FLAG_TEXT_EDITOR);
		}
	}
}
