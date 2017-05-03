package feathers.controls
{
	import avmplus.getQualifiedClassName;
	
	import feathers.core.IToggle;
	import feathers.themes.GuiThemeStyle;
	
	import starling.display.DisplayObject;
	
	import utils.UIStateSetHelper;

	/**
	 * 可换肤容器,支持布局
	 * @author wewell@163.com
	 */	
	public class SkinnableContainer extends LayoutGroup implements IToggle
	{
		protected var _styleName:String;
		protected var _skin:StateSkin;
		
		public function SkinnableContainer()
		{
			
		}
		
		public function get currentState():String
		{
			return _skin ? _skin.currentState : null;
		}
		
		public function set currentState(value:String):void
		{
			if(_skin)
			{
				_skin.onState(value);
			}
		}
		
		override public function get styleName():String
		{
			return _styleName;
		}
		
		override public function set styleName(value:String):void
		{
			if(_styleName == value )
				return;
			_styleName = value;
			skin = GuiThemeStyle.getStateSkin(_styleName);
		}
		
		override public function set styleClass(value:Class):void
		{
			if(!value)return;
			styleName = getQualifiedClassName(value).replace("::", ".");
		}
			
		public function get skin():StateSkin
		{
			return _skin;
		}
		
		public function set skin(value:StateSkin):void
		{
			if(_skin == value)return;
			
			_skin = value;
			while(this.numChildren)this.removeChildAt(0);
			_skin.toSprite(this);
			
			_styleName = UIStateSetHelper.getClassPath(value);
		}
		
		/**
		 * Indicates if the IToggle is selected or not.
		 */
		protected var _isSelected:Boolean;
		public function get isSelected():Boolean
		{
			return _isSelected;
		}
		
		/**
		 * @private
		 */
		public function set isSelected(value:Boolean):void
		{
			if(value == _isSelected)return;
			_isSelected = value;
			if(_skin)
			{
				for each(var d:DisplayObject in _skin.elementsContent)
				{
					d.visible = true;
				}
				_isSelected ? _skin.onState(UIState.SELECT) : _skin.onState(UIState.NORMAL);
			}
		}
		
		
		override public function dispose():void
		{
			super.dispose();
			this.removeChildren();
			_skin = null;
			_styleName = null;
		}
	}
}