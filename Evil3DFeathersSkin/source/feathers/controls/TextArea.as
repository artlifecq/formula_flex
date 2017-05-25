/*
Feathers
Copyright 2012-2016 Bowler Hat LLC. All Rights Reserved.

This program is free software. You can redistribute and/or modify it in
accordance with the terms of the accompanying license agreement.
*/
package feathers.controls
{
	import flash.geom.Point;
	import flash.text.TextFormatAlign;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	
	import away3d.events.Event;
	
	import feathers.controls.text.Fontter;
	import feathers.controls.text.ITextEditorViewPort;
	import feathers.controls.text.TextFieldTextEditorViewPort;
	import feathers.core.IAdvancedNativeFocusOwner;
	import feathers.core.IFeathersControl;
	import feathers.core.IMeasureDisplayObject;
	import feathers.core.INativeFocusOwner;
	import feathers.core.IStateContext;
	import feathers.core.IStateObserver;
	import feathers.core.PopUpManager;
	import feathers.core.PropertyProxy;
	import feathers.events.FeathersEventType;
	import feathers.skins.IStyleProvider;
	import feathers.utils.filter.NativeFilterPool;
	
	import starling.display.DisplayObject;
	import starling.events.KeyboardEvent;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.utils.Pool;

	/**
	 * Dispatched when the text area's <code>text</code> property changes.
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
	 * Dispatched when the display object's state changes.
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
	 * @eventType feathers.events.FeathersEventType.STATE_CHANGE
	 *
	 * @see #currentState
	 */
	[Event(name="stateChange",type="away3d.events.Event")]

	/**
	 * A text entry control that allows users to enter and edit multiple lines
	 * of uniformly-formatted text with the ability to scroll.
	 *
	 * <p>The following example sets the text in a text area, selects the text,
	 * and listens for when the text value changes:</p>
	 *
	 * <listing version="3.0">
	 * var textArea:TextArea = new TextArea();
	 * textArea.text = "Hello\nWorld"; //it's multiline!
	 * textArea.selectRange( 0, textArea.text.length );
	 * textArea.addEventListener( Event.CHANGE, textArea_changeHandler );
	 * this.addChild( textArea );</listing>
	 *
	 * @see ../../../help/text-area.html How to use the Feathers TextArea component
	 * @see feathers.controls.TextInput
	 */
	public class TextArea extends Scroller implements IAdvancedNativeFocusOwner, IStateContext
	{
		/**
		 * @private
		 * DEPRECATED: Replaced by <code>feathers.controls.ScrollPolicy.AUTO</code>.
		 *
		 * <p><strong>DEPRECATION WARNING:</strong> This constant is deprecated
		 * starting with Feathers 3.0. It will be removed in a future version of
		 * Feathers according to the standard
		 * <a target="_top" href="../../../help/deprecation-policy.html">Feathers deprecation policy</a>.</p>
		 */
		public static const SCROLL_POLICY_AUTO:String = "auto";

		/**
		 * @private
		 * DEPRECATED: Replaced by <code>feathers.controls.ScrollPolicy.ON</code>.
		 *
		 * <p><strong>DEPRECATION WARNING:</strong> This constant is deprecated
		 * starting with Feathers 3.0. It will be removed in a future version of
		 * Feathers according to the standard
		 * <a target="_top" href="../../../help/deprecation-policy.html">Feathers deprecation policy</a>.</p>
		 */
		public static const SCROLL_POLICY_ON:String = "on";

		/**
		 * @private
		 * DEPRECATED: Replaced by <code>feathers.controls.ScrollPolicy.OFF</code>.
		 *
		 * <p><strong>DEPRECATION WARNING:</strong> This constant is deprecated
		 * starting with Feathers 3.0. It will be removed in a future version of
		 * Feathers according to the standard
		 * <a target="_top" href="../../../help/deprecation-policy.html">Feathers deprecation policy</a>.</p>
		 */
		public static const SCROLL_POLICY_OFF:String = "off";

		/**
		 * @private
		 * DEPRECATED: Replaced by <code>feathers.controls.ScrollBarDisplayMode.FLOAT</code>.
		 *
		 * <p><strong>DEPRECATION WARNING:</strong> This constant is deprecated
		 * starting with Feathers 3.0. It will be removed in a future version of
		 * Feathers according to the standard
		 * <a target="_top" href="../../../help/deprecation-policy.html">Feathers deprecation policy</a>.</p>
		 */
		public static const SCROLL_BAR_DISPLAY_MODE_FLOAT:String = "float";

		/**
		 * @private
		 * DEPRECATED: Replaced by <code>feathers.controls.ScrollBarDisplayMode.FIXED</code>.
		 *
		 * <p><strong>DEPRECATION WARNING:</strong> This constant is deprecated
		 * starting with Feathers 3.0. It will be removed in a future version of
		 * Feathers according to the standard
		 * <a target="_top" href="../../../help/deprecation-policy.html">Feathers deprecation policy</a>.</p>
		 */
		public static const SCROLL_BAR_DISPLAY_MODE_FIXED:String = "fixed";

		/**
		 * @private
		 * DEPRECATED: Replaced by <code>feathers.controls.ScrollBarDisplayMode.FIXED_FLOAT</code>.
		 *
		 * <p><strong>DEPRECATION WARNING:</strong> This constant is deprecated
		 * starting with Feathers 3.0. It will be removed in a future version of
		 * Feathers according to the standard
		 * <a target="_top" href="../../../help/deprecation-policy.html">Feathers deprecation policy</a>.</p>
		 */
		public static const SCROLL_BAR_DISPLAY_MODE_FIXED_FLOAT:String = "fixedFloat";

		/**
		 * @private
		 * DEPRECATED: Replaced by <code>feathers.controls.ScrollBarDisplayMode.NONE</code>.
		 *
		 * <p><strong>DEPRECATION WARNING:</strong> This constant is deprecated
		 * starting with Feathers 3.0. It will be removed in a future version of
		 * Feathers according to the standard
		 * <a target="_top" href="../../../help/deprecation-policy.html">Feathers deprecation policy</a>.</p>
		 */
		public static const SCROLL_BAR_DISPLAY_MODE_NONE:String = "none";

		/**
		 * @private
		 * DEPRECATED: Replaced by <code>feathers.layout.RelativePosition.RIGHT</code>.
		 *
		 * <p><strong>DEPRECATION WARNING:</strong> This constant is deprecated
		 * starting with Feathers 3.0. It will be removed in a future version of
		 * Feathers according to the standard
		 * <a target="_top" href="../../../help/deprecation-policy.html">Feathers deprecation policy</a>.</p>
		 */
		public static const VERTICAL_SCROLL_BAR_POSITION_RIGHT:String = "right";

		/**
		 * @private
		 * DEPRECATED: Replaced by <code>feathers.layout.RelativePosition.LEFT</code>.
		 *
		 * <p><strong>DEPRECATION WARNING:</strong> This constant is deprecated
		 * starting with Feathers 3.0. It will be removed in a future version of
		 * Feathers according to the standard
		 * <a target="_top" href="../../../help/deprecation-policy.html">Feathers deprecation policy</a>.</p>
		 */
		public static const VERTICAL_SCROLL_BAR_POSITION_LEFT:String = "left";

		/**
		 * @private
		 * DEPRECATED: Replaced by <code>feathers.controls.ScrollInteractionMode.TOUCH</code>.
		 *
		 * <p><strong>DEPRECATION WARNING:</strong> This constant is deprecated
		 * starting with Feathers 3.0. It will be removed in a future version of
		 * Feathers according to the standard
		 * <a target="_top" href="../../../help/deprecation-policy.html">Feathers deprecation policy</a>.</p>
		 */
		public static const INTERACTION_MODE_TOUCH:String = "touch";

		/**
		 * @private
		 * DEPRECATED: Replaced by <code>feathers.controls.ScrollInteractionMode.MOUSE</code>.
		 *
		 * <p><strong>DEPRECATION WARNING:</strong> This constant is deprecated
		 * starting with Feathers 3.0. It will be removed in a future version of
		 * Feathers according to the standard
		 * <a target="_top" href="../../../help/deprecation-policy.html">Feathers deprecation policy</a>.</p>
		 */
		public static const INTERACTION_MODE_MOUSE:String = "mouse";

		/**
		 * @private
		 * DEPRECATED: Replaced by <code>feathers.controls.ScrollInteractionMode.TOUCH_AND_SCROLL_BARS</code>.
		 *
		 * <p><strong>DEPRECATION WARNING:</strong> This constant is deprecated
		 * starting with Feathers 3.0. It will be removed in a future version of
		 * Feathers according to the standard
		 * <a target="_top" href="../../../help/deprecation-policy.html">Feathers deprecation policy</a>.</p>
		 */
		public static const INTERACTION_MODE_TOUCH_AND_SCROLL_BARS:String = "touchAndScrollBars";

		/**
		 * @private
		 * DEPRECATED: Replaced by <code>feathers.layout.Direction.VERTICAL</code>.
		 *
		 * <p><strong>DEPRECATION WARNING:</strong> This constant is deprecated
		 * starting with Feathers 3.0. It will be removed in a future version of
		 * Feathers according to the standard
		 * <a target="_top" href="../../../help/deprecation-policy.html">Feathers deprecation policy</a>.</p>
		 */
		public static const MOUSE_WHEEL_SCROLL_DIRECTION_VERTICAL:String = "vertical";

		/**
		 * @private
		 * DEPRECATED: Replaced by <code>feathers.layout.Direction.HORIZONTAL</code>.
		 *
		 * <p><strong>DEPRECATION WARNING:</strong> This constant is deprecated
		 * starting with Feathers 3.0. It will be removed in a future version of
		 * Feathers according to the standard
		 * <a target="_top" href="../../../help/deprecation-policy.html">Feathers deprecation policy</a>.</p>
		 */
		public static const MOUSE_WHEEL_SCROLL_DIRECTION_HORIZONTAL:String = "horizontal";

		/**
		 * @private
		 * DEPRECATED: Replaced by <code>feathers.controls.DecelerationRate.NORMAL</code>.
		 *
		 * <p><strong>DEPRECATION WARNING:</strong> This constant is deprecated
		 * starting with Feathers 3.0. It will be removed in a future version of
		 * Feathers according to the standard
		 * <a target="_top" href="../../../help/deprecation-policy.html">Feathers deprecation policy</a>.</p>
		 */
		public static const DECELERATION_RATE_NORMAL:Number = 0.998;

		/**
		 * @private
		 * DEPRECATED: Replaced by <code>feathers.controls.DecelerationRate.FAST</code>.
		 *
		 * <p><strong>DEPRECATION WARNING:</strong> This constant is deprecated
		 * starting with Feathers 3.0. It will be removed in a future version of
		 * Feathers according to the standard
		 * <a target="_top" href="../../../help/deprecation-policy.html">Feathers deprecation policy</a>.</p>
		 */
		public static const DECELERATION_RATE_FAST:Number = 0.99;

		/**
		 * @private
		 * DEPRECATED: Replaced by <code>feathers.controls.TextInputState.ENABLED</code>.
		 *
		 * <p><strong>DEPRECATION WARNING:</strong> This constant is deprecated
		 * starting with Feathers 3.0. It will be removed in a future version of
		 * Feathers according to the standard
		 * <a target="_top" href="../../../help/deprecation-policy.html">Feathers deprecation policy</a>.</p>
		 */
		public static const STATE_ENABLED:String = "enabled";

		/**
		 * @private
		 * DEPRECATED: Replaced by <code>feathers.controls.TextInputState.DISABLED</code>.
		 *
		 * <p><strong>DEPRECATION WARNING:</strong> This constant is deprecated
		 * starting with Feathers 3.0. It will be removed in a future version of
		 * Feathers according to the standard
		 * <a target="_top" href="../../../help/deprecation-policy.html">Feathers deprecation policy</a>.</p>
		 */
		public static const STATE_DISABLED:String = "disabled";

		/**
		 * @private
		 * DEPRECATED: Replaced by <code>feathers.controls.TextInputState.FOCUSED</code>.
		 *
		 * <p><strong>DEPRECATION WARNING:</strong> This constant is deprecated
		 * starting with Feathers 3.0. It will be removed in a future version of
		 * Feathers according to the standard
		 * <a target="_top" href="../../../help/deprecation-policy.html">Feathers deprecation policy</a>.</p>
		 */
		public static const STATE_FOCUSED:String = "focused";

		/**
		 * The default value added to the <code>styleNameList</code> of the text
		 * editor.
		 *
		 * @see feathers.core.FeathersControl#styleNameList
		 */
		public static const DEFAULT_CHILD_STYLE_NAME_TEXT_EDITOR:String = "feathers-text-area-text-editor";

		/**
		 * The default value added to the <code>styleNameList</code> of the
		 * error callout.
		 *
		 * @see feathers.core.FeathersControl#styleNameList
		 */
		public static const DEFAULT_CHILD_STYLE_NAME_ERROR_CALLOUT:String = "feathers-text-input-error-callout";

		/**
		 * @private
		 */
		protected static const INVALIDATION_FLAG_ERROR_CALLOUT_FACTORY:String = "errorCalloutFactory";

		/**
		 * The default <code>IStyleProvider</code> for all <code>TextArea</code>
		 * components.
		 *
		 * @default null
		 * @see feathers.core.FeathersControl#styleProvider
		 */
		public static var globalStyleProvider:IStyleProvider;

		/**
		 * Constructor.
		 */
		public function TextArea()
		{
			super();
			this._measureViewPort = false;
			this.addEventListener(TouchEvent.TOUCH, textArea_touchHandler);
			this.addEventListener(Event.REMOVED_FROM_STAGE, textArea_removedFromStageHandler);
		}

		/**
		 * @private
		 */
		protected var textEditorViewPort:ITextEditorViewPort;

		/**
		 * The <code>TextCallout</code> that displays the value of the
		 * <code>errorString</code> property. The value may be <code>null</code>
		 * if there is no current error string or if the text area doesn't have
		 * focus.
		 *
		 * <p>For internal use in subclasses.</p>
		 */
		protected var callout:TextCallout;

		/**
		 * The value added to the <code>styleNameList</code> of the text editor.
		 * This variable is <code>protected</code> so that sub-classes can
		 * customize the text editor style name in their constructors instead of
		 * using the default style name defined by
		 * <code>DEFAULT_CHILD_STYLE_NAME_TEXT_EDITOR</code>.
		 *
		 * @see feathers.core.FeathersControl#styleNameList
		 */
		protected var textEditorStyleName:String = DEFAULT_CHILD_STYLE_NAME_TEXT_EDITOR;

		/**
		 * The value added to the <code>styleNameList</code> of the error
		 * callout. This variable is <code>protected</code> so that sub-classes
		 * can customize the prompt text renderer style name in their
		 * constructors instead of using the default style name defined by
		 * <code>DEFAULT_CHILD_STYLE_NAME_ERROR_CALLOUT</code>.
		 *
		 * @see feathers.core.FeathersControl#styleNameList
		 */
		protected var errorCalloutStyleName:String = DEFAULT_CHILD_STYLE_NAME_ERROR_CALLOUT;

		/**
		 * @private
		 */
		protected var _textEditorHasFocus:Boolean = false;

		/**
		 * A text editor may be an <code>INativeFocusOwner</code>, so we need to
		 * return the value of its <code>nativeFocus</code> property. If not,
		 * then we return <code>null</code>.
		 *
		 * @see feathers.core.INativeFocusOwner
		 */
		public function get nativeFocus():Object
		{
			if(this.textEditorViewPort is INativeFocusOwner)
			{
				return INativeFocusOwner(this.textEditorViewPort).nativeFocus;
			}
			return null;
		}

		/**
		 * @private
		 */
		protected var _isWaitingToSetFocus:Boolean = false;

		/**
		 * @private
		 */
		protected var _pendingSelectionStartIndex:int = -1;

		/**
		 * @private
		 */
		protected var _pendingSelectionEndIndex:int = -1;

		/**
		 * @private
		 */
		protected var _textAreaTouchPointID:int = -1;

		/**
		 * @private
		 */
		protected var _oldMouseCursor:String = null;

		/**
		 * @private
		 */
		protected var _ignoreTextChanges:Boolean = false;

		/**
		 * @private
		 */
		override protected function get defaultStyleProvider():IStyleProvider
		{
			return TextArea.globalStyleProvider;
		}

		/**
		 * @private
		 */
		override public function get isFocusEnabled():Boolean
		{
			if(this._isEditable)
			{
				//the behavior is different when editable.
				return this._isEnabled && this._isFocusEnabled;
			}
			return super.isFocusEnabled;
		}

		/**
		 * When the <code>FocusManager</code> isn't enabled, <code>hasFocus</code>
		 * can be used instead of <code>FocusManager.focus == textArea</code>
		 * to determine if the text area has focus.
		 */
		public function get hasFocus():Boolean
		{
			if(!this._focusManager)
			{
				return this._textEditorHasFocus;
			}
			return this._hasFocus;
		}

		/**
		 * @private
		 */
		override public function set isEnabled(value:Boolean):void
		{
			super.isEnabled = value;
			this.refreshState();
		}

		/**
		 * @private
		 */
		protected var _currentState:String = TextInputState.ENABLED;

		/**
		 * The current state of the text area.
		 *
		 * @see feathers.controls.TextInputState
		 * @see #event:stateChange feathers.events.FeathersEventType.STATE_CHANGE
		 */
		public function get currentState():String
		{
			return this._currentState;
		}

		/**
		 * @private
		 */
		protected var _text:String = "";

		/**
		 * The text displayed by the text area. The text area dispatches
		 * <code>Event.CHANGE</code> when the value of the <code>text</code>
		 * property changes for any reason.
		 *
		 * <p>In the following example, the text area's text is updated:</p>
		 *
		 * <listing version="3.0">
		 * textArea.text = "Hello World";</listing>
		 *
		 * @see #event:change
		 *
		 * @default ""
		 */
		public function get text():String
		{
			return this._text;
		}

		/**
		 * @private
		 */
		public function set text(value:String):void
		{
			if(!value)
			{
				//don't allow null or undefined
				value = "";
			}
			if(this._text == value)
			{
				return;
			}
			this._text = value;
			
			this.textEditorProperties.isHTML = false;
			if(this.textEditorViewPort && this.textEditorViewPort.text != value)
			{
				this.textEditorViewPort.text = value;
			}
			
			this.invalidate(INVALIDATION_FLAG_DATA);
			this.dispatchEventWith(Event.CHANGE);
		}
		
		public function get htmlText():String
		{
			return this._text;
		}
		
		/**
		 * @private
		 */
		public function set htmlText(value:String):void
		{
			if(!value)
			{
				//don't allow null or undefined
				value = "";
			}
			if(this._text == value)
			{
				return;
			}
			this._text = value;
			this.textEditorProperties.isHTML = value == "" ? false : true;
			this.invalidate(INVALIDATION_FLAG_DATA);
			this.dispatchEventWith(Event.CHANGE);
		}
		
		/**
		 * @private
		 */
		protected var _nativeFilters:Array = NativeFilterPool.onePixelBlackGlowFilters;
		
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
			this.textEditorProperties["nativeFilters"] = value;
			this.invalidate(INVALIDATION_FLAG_STYLES);
		}

		/**
		 * @private
		 */
		protected var _maxChars:int = 0;

		/**
		 * The maximum number of characters that may be entered.
		 *
		 * <p>In the following example, the text area's maximum characters is
		 * specified:</p>
		 *
		 * <listing version="3.0">
		 * textArea.maxChars = 10;</listing>
		 *
		 * @default 0
		 */
		public function get maxChars():int
		{
			return this._maxChars;
		}

		/**
		 * @private
		 */
		public function set maxChars(value:int):void
		{
			if(this._maxChars == value)
			{
				return;
			}
			this._maxChars = value;
			this.invalidate(INVALIDATION_FLAG_STYLES);
		}

		/**
		 * @private
		 */
		protected var _restrict:String;

		/**
		 * Limits the set of characters that may be entered.
		 *
		 * <p>In the following example, the text area's allowed characters are
		 * restricted:</p>
		 *
		 * <listing version="3.0">
		 * textArea.restrict = "0-9;</listing>
		 *
		 * @default null
		 */
		public function get restrict():String
		{
			return this._restrict;
		}

		/**
		 * @private
		 */
		public function set restrict(value:String):void
		{
			if(this._restrict == value)
			{
				return;
			}
			this._restrict = value;
			this.invalidate(INVALIDATION_FLAG_STYLES);
		}
		
		//======================================textFormat properties===========================
		//
		protected var mFontName:String = Fontter.DEFAULT_FONT_NAME;
		/** The name of the font (true type or bitmap font). */
		public function get fontName():String { return mFontName; }
		public function set fontName(value:String):void
		{
			mFontName = value;
			setTextFormatProperty("font", mFontName);
		}
		
		protected var mFontSize:int = Fontter.DEFAULT_FONT_SIZE;
		/** The size of the font. For bitmap fonts, use <code>BitmapFont.NATIVE_SIZE</code> for 
		 *  the original size. */
		public function get fontSize():Number { return mFontSize; }
		public function set fontSize(value:Number):void
		{
			mFontSize = value;
			setTextFormatProperty("size", mFontSize);
		}
		
		private var mTextAlign:String = TextFormatAlign.LEFT;
		public function get textAlign():String
		{
			return mTextAlign;
		}
		
		public function set textAlign(value:String):void
		{
			mTextAlign = value;
			setTextFormatProperty("align", mTextAlign);
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
		private function setTextFormatProperty(name:String, value:*):void
		{
			if(setTextFormatProperty != null)
			{
				textEditorProperties.textFormat[name] = value;
			}else{
				if(!_textFormatCacheProperties)
				{
					_textFormatCacheProperties={}
				}
				_textFormatCacheProperties[name] = value;
			}
			this.invalidate(INVALIDATION_FLAG_STYLES);
		}
		
		/**
		 * @private
		 */
		protected var _isEditable:Boolean = true;

		/**
		 * Determines if the text area is editable. If the text area is not
		 * editable, it will still appear enabled.
		 *
		 * <p>In the following example, the text area is not editable:</p>
		 *
		 * <listing version="3.0">
		 * textArea.isEditable = false;</listing>
		 *
		 * @default true
		 */
		public function get isEditable():Boolean
		{
			return this._isEditable;
		}

		/**
		 * @private
		 */
		public function set isEditable(value:Boolean):void
		{
			if(this._isEditable == value)
			{
				return;
			}
			this._isEditable = value;
			this.invalidate(INVALIDATION_FLAG_STYLES);
		}

		/**
		 * @private
		 */
		protected var _errorString:String = null;

		/**
		 * Error text to display in a <code>Callout</code> when the text area
		 * has focus. When this value is not <code>null</code> the text area's
		 * state is changed to <code>TextInputState.ERROR</code>.
		 *
		 * An empty string will change the background, but no
		 * <code>Callout</code> will appear on focus.
		 *
		 * To clear an error, the <code>errorString</code> property must be set
		 * to <code>null</code>
		 *
		 * <p>The following example displays an error string:</p>
		 *
		 * <listing version="3.0">
		 * textArea.errorString = "Something is wrong";</listing>
		 *
		 * @default null
		 *
		 * @see #currentState
		 */
		public function get errorString():String
		{
			return this._errorString;
		}

		/**
		 * @private
		 */
		public function set errorString(value:String):void
		{
			if(this._errorString === value)
			{
				return;
			}
			this._errorString = value;
			this.refreshState();
			this.invalidate(INVALIDATION_FLAG_STYLES);
		}

		/**
		 * @private
		 */
		protected var _stateToSkin:Object = {};

		/**
		 * A display object displayed behind the text area's content when it
		 * is disabled.
		 *
		 * <p>In the following example, the text area's disabled background skin
		 * is specified:</p>
		 *
		 * <listing version="3.0">
		 * textArea.isEnabled = false;
		 * textArea.backgroundDisabledSkin = new Image( texture );</listing>
		 *
		 * @default null
		 */
		override public function get backgroundDisabledSkin():DisplayObject
		{
			return this.getSkinForState(TextInputState.DISABLED);
		}

		/**
		 * @private
		 */
		override public function set backgroundDisabledSkin(value:DisplayObject):void
		{
			this.setSkinForState(TextInputState.DISABLED, value);
		}

		/**
		 * A display object displayed behind the text area's content when it
		 * has focus.
		 *
		 * <p>In the following example, the text area's focused background skin is
		 * specified:</p>
		 *
		 * <listing version="3.0">
		 * textArea.backgroundFocusedSkin = new Image( texture );</listing>
		 *
		 * @default null
		 */
		public function get backgroundFocusedSkin():DisplayObject
		{
			return this.getSkinForState(TextInputState.FOCUSED);
		}

		/**
		 * @private
		 */
		public function set backgroundFocusedSkin(value:DisplayObject):void
		{
			this.setSkinForState(TextInputState.FOCUSED, value);
		}

		/**
		 * The skin used for the text area's error state. If <code>null</code>,
		 * then <code>backgroundSkin</code> is used instead.
		 *
		 * <p>The following example gives the text area a skin for the error state:</p>
		 *
		 * <listing version="3.0">
		 * textArea.backgroundErrorSkin = new Image( texture );</listing>
		 *
		 * @default null
		 */
		public function get backgroundErrorSkin():DisplayObject
		{
			return this.getSkinForState(TextInputState.ERROR);
		}

		/**
		 * @private
		 */
		public function set backgroundErrorSkin(value:DisplayObject):void
		{
			this.setSkinForState(TextInputState.ERROR, value);
		}

		/**
		 * @private
		 */
		protected var _stateToSkinFunction:Function;

		/**
		 * DEPRECATED: Create a <code>feathers.skins.ImageSkin</code> instead,
		 * and pass to the <code>backgroundSkin</code> property.
		 *
		 * <p><strong>DEPRECATION WARNING:</strong> This property is deprecated
		 * starting with Feathers 3.0. It will be removed in a future version of
		 * Feathers according to the standard
		 * <a href="../../../help/deprecation-policy.html">Feathers deprecation policy</a>.</p>
		 */
		public function get stateToSkinFunction():Function
		{
			return this._stateToSkinFunction;
		}

		/**
		 * @private
		 */
		public function set stateToSkinFunction(value:Function):void
		{
			if(this._stateToSkinFunction == value)
			{
				return;
			}
			this._stateToSkinFunction = value;
			this.invalidate(INVALIDATION_FLAG_SKIN);
		}

		/**
		 * @private
		 */
		protected var _textEditorFactory:Function;

		/**
		 * A function used to instantiate the text editor view port. If
		 * <code>null</code>, a <code>TextFieldTextEditorViewPort</code> will
		 * be instantiated. The text editor must be an instance of
		 * <code>ITextEditorViewPort</code>. This factory can be used to change
		 * properties on the text editor view port when it is first created. For
		 * instance, if you are skinning Feathers components without a theme,
		 * you might use this factory to set styles on the text editor view
		 * port.
		 *
		 * <p>The factory should have the following function signature:</p>
		 * <pre>function():ITextEditorViewPort</pre>
		 *
		 * <p>In the following example, a custom text editor factory is passed
		 * to the text area:</p>
		 *
		 * <listing version="3.0">
		 * textArea.textEditorFactory = function():ITextEditorViewPort
		 * {
		 *     return new TextFieldTextEditorViewPort();
		 * };</listing>
		 *
		 * @default null
		 *
		 * @see feathers.controls.text.ITextEditorViewPort
		 */
		public function get textEditorFactory():Function
		{
			return this._textEditorFactory;
		}

		/**
		 * @private
		 */
		public function set textEditorFactory(value:Function):void
		{
			if(this._textEditorFactory == value)
			{
				return;
			}
			this._textEditorFactory = value;
			this.invalidate(INVALIDATION_FLAG_TEXT_EDITOR);
		}

		/**
		 * @private
		 */
		protected var _customTextEditorStyleName:String;

		/**
		 * A style name to add to the text area's text editor sub-component.
		 * Typically used by a theme to provide different styles to different
		 * text areas.
		 *
		 * <p>In the following example, a custom text editor style name is
		 * passed to the text area:</p>
		 *
		 * <listing version="3.0">
		 * textArea.customTextEditorStyleName = "my-custom-text-area-text-editor";</listing>
		 *
		 * <p>In your theme, you can target this sub-component style name to
		 * provide different styles than the default:</p>
		 *
		 * <listing version="3.0">
		 * getStyleProviderForClass( TextFieldTextEditorViewPort ).setFunctionForStyleName( "my-custom-text-area-text-editor", setCustomTextAreaTextEditorStyles );</listing>
		 *
		 * @default null
		 *
		 * @see #DEFAULT_CHILD_STYLE_NAME_TEXT_EDITOR
		 * @see feathers.core.FeathersControl#styleNameList
		 * @see #textEditorFactory
		 */
		public function get customTextEditorStyleName():String
		{
			return this._customTextEditorStyleName;
		}

		/**
		 * @private
		 */
		public function set customTextEditorStyleName(value:String):void
		{
			if(this._customTextEditorStyleName == value)
			{
				return;
			}
			this._customTextEditorStyleName = value;
			this.invalidate(INVALIDATION_FLAG_TEXT_RENDERER);
		}

		/**
		 * @private
		 */
		protected var _textEditorProperties:PropertyProxy;

		/**
		 * An object that stores properties for the text area's text editor
		 * sub-component, and the properties will be passed down to the
		 * text editor when the text area validates. The available properties
		 * depend on which <code>ITextEditorViewPort</code> implementation is
		 * returned by <code>textEditorFactory</code>. Refer to
		 * <a href="text/ITextEditorViewPort.html"><code>feathers.controls.text.ITextEditorViewPort</code></a>
		 * for a list of available text editor implementations for text area.
		 *
		 * <p>If the subcomponent has its own subcomponents, their properties
		 * can be set too, using attribute <code>&#64;</code> notation. For example,
		 * to set the skin on the thumb which is in a <code>SimpleScrollBar</code>,
		 * which is in a <code>List</code>, you can use the following syntax:</p>
		 * <pre>list.verticalScrollBarProperties.&#64;thumbProperties.defaultSkin = new Image(texture);</pre>
		 *
		 * <p>Setting properties in a <code>textEditorFactory</code> function
		 * instead of using <code>textEditorProperties</code> will result in
		 * better performance.</p>
		 *
		 * <p>In the following example, the text input's text editor properties
		 * are specified (this example assumes that the text editor is a
		 * <code>TextFieldTextEditorViewPort</code>):</p>
		 *
		 * <listing version="3.0">
		 * textArea.textEditorProperties.textFormat = new TextFormat( "Source Sans Pro", 16, 0x333333);
		 * textArea.textEditorProperties.embedFonts = true;</listing>
		 *
		 * @default null
		 *
		 * @see #textEditorFactory
		 * @see feathers.controls.text.ITextEditorViewPort
		 */
		public function get textEditorProperties():Object
		{
			if(!this._textEditorProperties)
			{
				this._textEditorProperties = new PropertyProxy(childProperties_onChange);
			}
			if(!this._textEditorProperties.textFormat)
			{
				this._textEditorProperties.textFormat = Fontter.creatDefaultFontTextFormat();
			}
			return this._textEditorProperties;
		}

		/**
		 * @private
		 */
		public function set textEditorProperties(value:Object):void
		{
			if(this._textEditorProperties == value)
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
			if(this._textEditorProperties)
			{
				this._textEditorProperties.removeOnChangeCallback(childProperties_onChange);
			}
			this._textEditorProperties = PropertyProxy(value);
			if(this._textEditorProperties)
			{
				this._textEditorProperties.addOnChangeCallback(childProperties_onChange);
			}
			this.invalidate(INVALIDATION_FLAG_STYLES);
		}

		/**
		 * @private
		 */
		protected var _customErrorCalloutStyleName:String;

		/**
		 * A style name to add to the text area's error callout sub-component.
		 * Typically used by a theme to provide different styles to different
		 * text areas.
		 *
		 * <p>In the following example, a custom error callout style name
		 * is passed to the text area:</p>
		 *
		 * <listing version="3.0">
		 * textArea.customErrorCalloutStyleName = "my-custom-text-area-error-callout";</listing>
		 *
		 * <p>In your theme, you can target this sub-component style name to
		 * provide different styles than the default:</p>
		 *
		 * <listing version="3.0">
		 * getStyleProviderForClass( Callout ).setFunctionForStyleName( "my-custom-text-area-error-callout", setCustomTextAreaErrorCalloutStyles );</listing>
		 *
		 * @default null
		 *
		 * @see #DEFAULT_CHILD_STYLE_NAME_ERROR_CALLOUT
		 * @see feathers.core.FeathersControl#styleNameList
		 */
		public function get customErrorCalloutStyleName():String
		{
			return this._customErrorCalloutStyleName;
		}

		/**
		 * @private
		 */
		public function set customErrorCalloutStyleName(value:String):void
		{
			if(this._customErrorCalloutStyleName == value)
			{
				return;
			}
			this._customErrorCalloutStyleName = value;
			this.invalidate(INVALIDATION_FLAG_ERROR_CALLOUT_FACTORY);
		}

		/**
		 * @inheritDoc
		 */
		override public function showFocus():void
		{
			if(!this._focusManager || this._focusManager.focus != this)
			{
				return;
			}
			this.selectRange(0, this._text.length);
			super.showFocus();
		}

		/**
		 * Focuses the text area control so that it may be edited.
		 */
		public function setFocus():void
		{
/*			if(this._textEditorHasFocus)
			{
				return;
			}*/
			if(this.textEditorViewPort)
			{
				this._isWaitingToSetFocus = false;
				this.textEditorViewPort.setFocus();
			}
			else
			{
				this._isWaitingToSetFocus = true;
				this.invalidate(INVALIDATION_FLAG_SELECTED);
			}
		}

		/**
		 * Manually removes focus from the text area control.
		 */
		public function clearFocus():void
		{
			this._isWaitingToSetFocus = false;
			if(!this.textEditorViewPort || !this._textEditorHasFocus)
			{
				return;
			}
			this.textEditorViewPort.clearFocus();
		}

		/**
		 * Sets the range of selected characters. If both values are the same,
		 * or the end index is <code>-1</code>, the text insertion position is
		 * changed and nothing is selected.
		 */
		public function selectRange(startIndex:int, endIndex:int = -1):void
		{
			if(endIndex < 0)
			{
				endIndex = startIndex;
			}
			if(startIndex < 0)
			{
				throw new RangeError("Expected start index greater than or equal to 0. Received " + startIndex + ".");
			}
			if(endIndex > this._text.length)
			{
				throw new RangeError("Expected start index less than " + this._text.length + ". Received " + endIndex + ".");
			}

			if(this.textEditorViewPort)
			{
				this._pendingSelectionStartIndex = -1;
				this._pendingSelectionEndIndex = -1;
				this.textEditorViewPort.selectRange(startIndex, endIndex);
			}
			else
			{
				this._pendingSelectionStartIndex = startIndex;
				this._pendingSelectionEndIndex = endIndex;
				this.invalidate(INVALIDATION_FLAG_SELECTED);
			}
		}

		/**
		 * @private
		 */
		override public function dispose():void
		{
			//we don't dispose it if the text area is the parent because it'll
			//already get disposed in super.dispose()
			for(var state:String in this._stateToSkin)
			{
				var skin:DisplayObject = this._stateToSkin[state] as DisplayObject;
				if(skin !== null && skin.parent !== this)
				{
					skin.dispose();
				}
			}
			super.dispose();
		}

		/**
		 * Gets the skin to be used by the text area when its
		 * <code>currentState</code> property matches the specified state value.
		 *
		 * <p>If a skin is not defined for a specific state, returns
		 * <code>null</code>.</p>
		 *
		 * @see #setSkinForState()
		 * @see feathers.controls.TextInputState
		 */
		public function getSkinForState(state:String):DisplayObject
		{
			return this._stateToSkin[state] as DisplayObject;
		}

		/**
		 * Sets the skin to be used by the text area when its
		 * <code>currentState</code> property matches the specified state value.
		 *
		 * <p>If a skin is not defined for a specific state, the value of the
		 * <code>backgroundSkin</code> property will be used instead.</p>
		 *
		 * @see #backgroundSkin
		 * @see #getSkinForState()
		 * @see feathers.controls.TextInputState
		 */
		public function setSkinForState(state:String, skin:DisplayObject):void
		{
			if(skin !== null)
			{
				this._stateToSkin[state] = skin;
			}
			else
			{
				delete this._stateToSkin[state];
			}
			this.invalidate(INVALIDATION_FLAG_STYLES);
		}

		/**
		 * @private
		 */
		override protected function draw():void
		{
			var textEditorInvalid:Boolean = this.isInvalid(INVALIDATION_FLAG_TEXT_EDITOR);
			var dataInvalid:Boolean = this.isInvalid(INVALIDATION_FLAG_DATA);
			var stylesInvalid:Boolean = this.isInvalid(INVALIDATION_FLAG_STYLES);
			var stateInvalid:Boolean = this.isInvalid(INVALIDATION_FLAG_STATE);

			if(textEditorInvalid)
			{
				this.createTextEditor();
			}

			if(textEditorInvalid || stylesInvalid)
			{
				this.refreshTextEditorProperties();
			}

			if(textEditorInvalid || dataInvalid)
			{
				var oldIgnoreTextChanges:Boolean = this._ignoreTextChanges;
				this._ignoreTextChanges = true;
				this.textEditorViewPort.text = this._text;
				this._ignoreTextChanges = oldIgnoreTextChanges;
			}

			if(textEditorInvalid || stateInvalid)
			{
				this.textEditorViewPort.isEnabled = this._isEnabled;
				if(!this._isEnabled && Mouse.supportsNativeCursor && this._oldMouseCursor)
				{
					Mouse.cursor = this._oldMouseCursor;
					this._oldMouseCursor = null;
				}
			}

			super.draw();

			this.doPendingActions();
		}

		/**
		 * Creates and adds the <code>textEditorViewPort</code> sub-component and
		 * removes the old instance, if one exists.
		 *
		 * <p>Meant for internal use, and subclasses may override this function
		 * with a custom implementation.</p>
		 *
		 * @see #textEditorViewPort
		 * @see #textEditorFactory
		 */
		protected function createTextEditor():void
		{
			if(this.textEditorViewPort)
			{
				this.textEditorViewPort.removeEventListener(Event.CHANGE, textEditor_changeHandler);
				this.textEditorViewPort.removeEventListener(FeathersEventType.TEXT_INPUT, textEditor_textInputHandler);
				this.textEditorViewPort.removeEventListener(FeathersEventType.ENTER, textEditor_enterHandler);
				this.textEditorViewPort.removeEventListener(FeathersEventType.FOCUS_IN, textEditor_focusInHandler);
				this.textEditorViewPort.removeEventListener(FeathersEventType.FOCUS_OUT, textEditor_focusOutHandler);
				this.textEditorViewPort = null;
			}

			if(this._textEditorFactory != null)
			{
				this.textEditorViewPort = ITextEditorViewPort(this._textEditorFactory());
			}
			else
			{
				this.textEditorViewPort = new TextFieldTextEditorViewPort();
			}
			var textEditorStyleName:String = this._customTextEditorStyleName != null ? this._customTextEditorStyleName : this.textEditorStyleName;
			this.textEditorViewPort.styleNameList.add(textEditorStyleName);
			if(this.textEditorViewPort is IStateObserver)
			{
				IStateObserver(this.textEditorViewPort).stateContext = this;
			}
			this.textEditorViewPort.addEventListener(Event.CHANGE, textEditor_changeHandler);
			this.textEditorViewPort.addEventListener(FeathersEventType.TEXT_INPUT, textEditor_textInputHandler);
			this.textEditorViewPort.addEventListener(FeathersEventType.ENTER, textEditor_enterHandler);
			this.textEditorViewPort.addEventListener(FeathersEventType.FOCUS_IN, textEditor_focusInHandler);
			this.textEditorViewPort.addEventListener(FeathersEventType.FOCUS_OUT, textEditor_focusOutHandler);

			var oldViewPort:ITextEditorViewPort = ITextEditorViewPort(this._viewPort);
			this.viewPort = this.textEditorViewPort;
			if(oldViewPort)
			{
				//the view port setter won't do this
				oldViewPort.dispose();
			}
		}

		/**
		 * @private
		 */
		protected function createErrorCallout():void
		{
			if(this.callout)
			{
				this.callout.removeFromParent(true);
				this.callout = null;
			}

			if(this._errorString === null)
			{
				return;
			}
			this.callout = new TextCallout();
			var errorCalloutStyleName:String = this._customErrorCalloutStyleName != null ? this._customErrorCalloutStyleName : this.errorCalloutStyleName;
			this.callout.styleNameList.add(errorCalloutStyleName);
			this.callout.closeOnKeys = null;
			this.callout.closeOnTouchBeganOutside = false;
			this.callout.closeOnTouchEndedOutside = false;
			this.callout.touchable = false;
			this.callout.text = this._errorString;
			this.callout.origin = this;
			PopUpManager.addPopUp(this.callout, false, false);
		}

		/**
		 * @private
		 */
		protected function changeState(state:String):void
		{
			if(this._currentState === state)
			{
				return;
			}
			this._currentState = state;
			this.invalidate(INVALIDATION_FLAG_STATE);
			this.dispatchEventWith(FeathersEventType.STATE_CHANGE);
		}

		/**
		 * @private
		 */
		protected function doPendingActions():void
		{
			if(this._isWaitingToSetFocus || (this._focusManager && this._focusManager.focus == this))
			{
				this._isWaitingToSetFocus = false;
				if(!this._textEditorHasFocus)
				{
					this.textEditorViewPort.setFocus();
				}
			}
			if(this._pendingSelectionStartIndex >= 0)
			{
				var startIndex:int = this._pendingSelectionStartIndex;
				var endIndex:int = this._pendingSelectionEndIndex;
				this._pendingSelectionStartIndex = -1;
				this._pendingSelectionEndIndex = -1;
				this.selectRange(startIndex, endIndex);
			}
		}
		
		/**
		 * @copy feathers.core.ITextEditor#selectionBeginIndex
		 */
		public function get selectionBeginIndex():int
		{
			if(this._pendingSelectionStartIndex >= 0)
			{
				return this._pendingSelectionStartIndex;
			}
			if(this.textEditorViewPort)
			{
				return this.textEditorViewPort.selectionBeginIndex;
			}
			return 0;
		}
		
		/**
		 * @copy feathers.core.ITextEditor#selectionEndIndex
		 */
		public function get selectionEndIndex():int
		{
			if(this._pendingSelectionEndIndex >= 0)
			{
				return this._pendingSelectionEndIndex;
			}
			if(this.textEditorViewPort)
			{
				return this.textEditorViewPort.selectionEndIndex;
			}
			return 0;
		}

		/**
		 * @private
		 */
		protected function refreshTextEditorProperties():void
		{
			this.textEditorViewPort.maxChars = this._maxChars;
			this.textEditorViewPort.restrict = this._restrict;
			this.textEditorViewPort.isEditable = this._isEditable;
			for(var propertyName:String in this._textEditorProperties)
			{
				var propertyValue:Object = this._textEditorProperties[propertyName];
				this.textEditorViewPort[propertyName] = propertyValue;
				if(propertyName == "textFormat" && _textFormatCacheProperties)
				{
					for (var prop:String in _textFormatCacheProperties)
					{
						propertyValue[prop] = _textFormatCacheProperties[prop];
					}
					_textFormatCacheProperties = null;
				}
			}
		}

		/**
		 * @private
		 */
		override protected function refreshBackgroundSkin():void
		{
			var oldSkin:DisplayObject = this.currentBackgroundSkin;
			this.currentBackgroundSkin = this.getCurrentSkin();
			if(oldSkin !== this.currentBackgroundSkin)
			{
				if(oldSkin !== null)
				{
					if(oldSkin is IStateObserver)
					{
						IStateObserver(oldSkin).stateContext = null;
					}
					this.removeChild(oldSkin, false);
				}
				if(this.currentBackgroundSkin !== null)
				{
					if(this.currentBackgroundSkin is IStateObserver)
					{
						IStateObserver(this.currentBackgroundSkin).stateContext = this;
					}
					this.addChildAt(this.currentBackgroundSkin, 0);
					if(this.currentBackgroundSkin is IFeathersControl)
					{
						IFeathersControl(this.currentBackgroundSkin).initializeNow();
					}
					if(this.currentBackgroundSkin is IMeasureDisplayObject)
					{
						var measureSkin:IMeasureDisplayObject = IMeasureDisplayObject(this.currentBackgroundSkin);
						this._explicitBackgroundWidth = measureSkin.explicitWidth;
						this._explicitBackgroundHeight = measureSkin.explicitHeight;
						this._explicitBackgroundMinWidth = measureSkin.explicitMinWidth;
						this._explicitBackgroundMinHeight = measureSkin.explicitMinHeight;
					}
					else
					{
						this._explicitBackgroundWidth = this.currentBackgroundSkin.width;
						this._explicitBackgroundHeight = this.currentBackgroundSkin.height;
						this._explicitBackgroundMinWidth = this._explicitBackgroundWidth;
						this._explicitBackgroundMinHeight = this._explicitBackgroundHeight;
					}
				}
			}
		}

		/**
		 * @private
		 */
		protected function getCurrentSkin():DisplayObject
		{
			if(this._stateToSkinFunction != null)
			{
				return DisplayObject(this._stateToSkinFunction(this, this._currentState, this.currentBackgroundSkin));
			}
			var result:DisplayObject = this._stateToSkin[this._currentState] as DisplayObject;
			if(result !== null)
			{
				return result;
			}
			return this._backgroundSkin;
		}

		/**
		 * @private
		 */
		protected function refreshState():void
		{
			if(this._isEnabled)
			{
				if(this._textEditorHasFocus)
				{
					this.changeState(TextInputState.FOCUSED);
				}
				else if(this._errorString !== null)
				{
					this.changeState(TextInputState.ERROR);
				}
				else
				{
					this.changeState(TextInputState.ENABLED);
				}
			}
			else
			{
				this.changeState(TextInputState.DISABLED);
			}
		}

		/**
		 * @private
		 */
		protected function setFocusOnTextEditorWithTouch(touch:Touch):void
		{
			if(!this.isFocusEnabled)
			{
				return;
			}
			var point:Point = Pool.getPoint();
			touch.getLocation(this.stage, point);
			var isInBounds:Boolean = this.contains(this.stage.hitTest(point));
			if(!this._textEditorHasFocus && isInBounds)
			{
				this.globalToLocal(point, point);
				point.x -= this._paddingLeft;
				point.y -= this._paddingTop;
				//we account for the scroll position in the text editor view
				//port, so don't do it here!
				this._isWaitingToSetFocus = false;
				this.textEditorViewPort.setFocus(point);
			}
			Pool.putPoint(point);
		}

		/**
		 * @private
		 */
		protected function textArea_touchHandler(event:TouchEvent):void
		{
			if(!this._isEnabled)
			{
				this._textAreaTouchPointID = -1;
				return;
			}

			var horizontalScrollBar:DisplayObject = DisplayObject(this.horizontalScrollBar);
			var verticalScrollBar:DisplayObject = DisplayObject(this.verticalScrollBar);
			if(this._textAreaTouchPointID >= 0)
			{
				var touch:Touch = event.getTouch(this, TouchPhase.ENDED, this._textAreaTouchPointID);
				if(!touch || touch.isTouching(verticalScrollBar) || touch.isTouching(horizontalScrollBar))
				{
					return;
				}
				this.removeEventListener(Event.SCROLL, textArea_scrollHandler);
				this._textAreaTouchPointID = -1;
				if(this.textEditorViewPort.setTouchFocusOnEndedPhase)
				{
					this.setFocusOnTextEditorWithTouch(touch);
				}
			}
			else
			{
				touch = event.getTouch(this, TouchPhase.BEGAN);
				if(touch)
				{
					if(touch.isTouching(verticalScrollBar) || touch.isTouching(horizontalScrollBar))
					{
						return;
					}
					this._textAreaTouchPointID = touch.id;
					if(!this.textEditorViewPort.setTouchFocusOnEndedPhase)
					{
						this.setFocusOnTextEditorWithTouch(touch);
					}
					this.addEventListener(Event.SCROLL, textArea_scrollHandler);
					return;
				}
				touch = event.getTouch(this, TouchPhase.HOVER);
				if(touch)
				{
					if(touch.isTouching(verticalScrollBar) || touch.isTouching(horizontalScrollBar))
					{
						return;
					}
					if(Mouse.supportsNativeCursor && !this._oldMouseCursor)
					{
						this._oldMouseCursor = Mouse.cursor;
						Mouse.cursor = MouseCursor.IBEAM;
					}
					return;
				}
				//end hover
				if(Mouse.supportsNativeCursor && this._oldMouseCursor)
				{
					Mouse.cursor = this._oldMouseCursor;
					this._oldMouseCursor = null;
				}
			}
		}

		/**
		 * @private
		 */
		protected function textArea_scrollHandler(event:Event):void
		{
			this.removeEventListener(Event.SCROLL, textArea_scrollHandler);
			this._textAreaTouchPointID = -1;
		}

		/**
		 * @private
		 */
		protected function textArea_removedFromStageHandler(event:Event):void
		{
			if(!this._focusManager && this._textEditorHasFocus)
			{
				this.clearFocus();
			}
			this._isWaitingToSetFocus = false;
			this._textEditorHasFocus = false;
			this._textAreaTouchPointID = -1;
			this.removeEventListener(Event.SCROLL, textArea_scrollHandler);
			if(Mouse.supportsNativeCursor && this._oldMouseCursor)
			{
				Mouse.cursor = this._oldMouseCursor;
				this._oldMouseCursor = null;
			}
		}

		/**
		 * @private
		 */
		override protected function focusInHandler(event:Event):void
		{
			if(!this._focusManager)
			{
				return;
			}
			super.focusInHandler(event);
			this.setFocus();
		}

		/**
		 * @private
		 */
		override protected function focusOutHandler(event:Event):void
		{
			if(!this._focusManager)
			{
				return;
			}
			super.focusOutHandler(event);
			this.textEditorViewPort.clearFocus();
			this.invalidate(INVALIDATION_FLAG_STATE);
		}

		/**
		 * @private
		 */
		override protected function stage_keyDownHandler(event:KeyboardEvent):void
		{
			if(this._isEditable)
			{
				return;
			}
			super.stage_keyDownHandler(event);
		}
		/**
		 * @private
		 */
		protected function textEditor_textInputHandler(event:Event):void
		{
			dispatchEvent(event);
		}

		/**
		 * @private
		 */
		protected function textEditor_changeHandler(event:Event):void
		{
			if(this._ignoreTextChanges)
			{
				return;
			}
			this.text = this.textEditorViewPort.text;
		}
		
		/**
		 * @private
		 */
		protected function textEditor_enterHandler(event:Event):void
		{
			if(autoClearFocusOnEnterKeyDown)
			{
				textEditor_focusOutHandler(null);
			}
			this.dispatchEventWith(FeathersEventType.ENTER);
		}
		
		/**wewell*/
		public static var autoClearFocusOnEnterKeyDownGlobal:Boolean = true;
		public var autoClearFocusOnEnterKeyDown:Boolean = autoClearFocusOnEnterKeyDownGlobal;

		/**
		 * @private
		 */
		protected function textEditor_focusInHandler(event:Event):void
		{
			this._textEditorHasFocus = true;
			this.refreshState();
			if(this._errorString !== null && this._errorString.length > 0)
			{
				this.createErrorCallout();
			}
			this._touchPointID = -1;
			this.invalidate(INVALIDATION_FLAG_STATE);
			if(this._focusManager && this.isFocusEnabled && this._focusManager.focus !== this)
			{
				//if setFocus() was called manually, we need to notify the focus
				//manager (unless isFocusEnabled is false).
				//if the focus manager already knows that we have focus, it will
				//simply return without doing anything.
				this._focusManager.focus = this;
			}
			else if(!this._focusManager)
			{
				this.dispatchEventWith(FeathersEventType.FOCUS_IN);
			}
		}

		/**
		 * @private
		 */
		protected function textEditor_focusOutHandler(event:Event):void
		{
			this._textEditorHasFocus = false;
			this.refreshState();
			if(this.callout)
			{
				this.callout.removeFromParent(true);
				this.callout = null;
			}
			this.invalidate(INVALIDATION_FLAG_STATE);
			if(this._focusManager && this._focusManager.focus === this)
			{
				//if clearFocus() was called manually, we need to notify the
				//focus manager if it still thinks we have focus.
				this._focusManager.focus = null;
			}
			else if(!this._focusManager)
			{
				this.dispatchEventWith(FeathersEventType.FOCUS_OUT);
			}
		}
	}
}
