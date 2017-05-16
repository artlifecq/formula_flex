package feathers.controls
{
	import flash.text.TextFormat;
	
	import away3d.debug.Debug;
	import away3d.entities.Mesh;
	
	import feathers.controls.text.Fontter;
	import feathers.layout.AnchorLayout;
	import feathers.layout.ILayout;
	import feathers.layout.ILayoutDisplayObject;
	import feathers.layout.IVirtualLayout;
	import feathers.layout.ViewPortBounds;
	import feathers.themes.GuiThemeStyle;
	
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	import starling.events.Event;
	
	import utils.UIStateSetHelper;

	/**
	 * 界面配置文件顶级类 
	 * 此类设计轻量， 不继承显示对象，但提供快速生成UI的接口:toSprite()。
	 * @author wewell
	 */	
	public class StateSkin
	{
		public var currentState:String = "normal";
		
		/**各状态详细配置数据**/ 
		public var states:Object;
		
		/**各状态纹理配置,例如{up:"assets/imagebtn/skin1/up.png", down:"assets/imagebtn/skin1/down.png"}**/ 
		public var skinNames:Object;
		
		/**UI元素有序数组**/ 
		public var elementsContent:Array;
		
		/**支持布局管理**/ 
		public var needAnchorLayout:Boolean;
		
		public var width:int;
		public var height:int;
		
		/**皮肤对应的显示对象容器**/ 
		public var container:Sprite;
		
		private static var defaultTextFormat:TextFormat;
			
		public function StateSkin()
		{
		}
		
		/**
		 * 把皮肤配置转换成显示对象并返回
		 * @param parent 指定的Sprite
		 * @return 添加子组件后的Sprite
		 */		
		public function toSprite(container:Sprite=null):Sprite{
			if(container == null)container = new starling.display.Sprite();
			this.container = container;
			
			var d:DisplayObject;
			for each(d in elementsContent)
			{
				container.addChild(d);
				
				//皮肤内某对象中有存在布局数据, 则皮肤所附容器需要动态布局
				if(!needAnchorLayout && ILayoutDisplayObject(d).layoutData != null)
				{
					needAnchorLayout = true;
				}
			}
			
			if(!container.width && this.width)container.width = width;
			if(!container.height && this.height)container.height = height;
			
			if(container.stage != null)
			{
				onState(UIState.INIT);
				initDefaultLayout();
			}else
			{
				container.addEventListener(Event.ADDED_TO_STAGE, onAddToStage);
			}
			return container;
		}
		
		/**
		 * 确保组件执行完自身默认设置之后再执行自定义设置
		 * @param e
		 */
		private function onAddToStage(e:Event):void
		{
			e.target.removeEventListener(Event.ADDED_TO_STAGE, onAddToStage);
			
			onState(UIState.INIT);
			
			initDefaultLayout();
		}
		
		/**
		 *默认情况下，所有的文本渲染都是通过 FeathersControl.defaultTextRendererFactory() 实现的,在添加到舞台之后默认调用一次
		 *使states中的某个state数据配置生效
		 *state可能的值见UIState
		 * 
		 */		
		public function onState(state:String):void
		{
			currentState = state;
			
			var stateDatas:Array = states.hasOwnProperty(state) ? states[state] : null;
			if(!stateDatas)return;
			
			var t:String;
			var n:String;
			var v:*;
			
			var ts:Object = {};
			var sub:*;//子元件
			for each(var sets:Object in stateDatas)
			{
				t = sets[UIState.TARGET];
				n = sets[UIState.NAME];
				v = sets[UIState.VALUE];
				if(!t || !n || !this.hasOwnProperty(t) || !this[t])
				{
					continue;
				}
				
				//直接属性设置(子元件的x,y,width,height,textAlign等)
				sub = this[t];
				if(sub.hasOwnProperty(n)){
					sub[n] = v;		
//					trace("set init state:", n, v);
				}
				
				//间接属性
				if(!ts[t])	ts[t] = {};
				ts[t][n]=v;
			}
			
			//间接属性设置(子元件的textFormat属性)
			if(!defaultTextFormat)
				defaultTextFormat = Fontter.creatDefaultFontTextFormat();
			
			var tfmPropName:String;
			for (t in ts)
			{
				sub = this[t];
				var nv:Object = ts[t];
				var tfm:TextFormat = null;
				if(sub is Button){
					tfm = sub.defaultLabelProperties.textFormat;
				}else if(sub is TextInput || sub is TextArea)
				{
					tfm = sub.textEditorProperties.textFormat;
				}
				var needSet:Boolean = false;
				for (n in nv)
				{
					tfmPropName = UIState.transToTextFormatProp(n);
					if(defaultTextFormat.hasOwnProperty(tfmPropName))
					{
						if(!needSet)
						{
							needSet = true;
							if(tfm != null)
							{
								tfm = UIStateSetHelper.clone(tfm);
							}else
							{
								tfm = UIStateSetHelper.clone(defaultTextFormat);
							}
						}
						tfm[tfmPropName] = nv[n];
					}
				}
				
				if(tfm != null)
				{
					if(sub is Button){
						Button(sub).defaultLabelProperties.textFormat =  tfm;
					}else if(sub is TextInput || sub is TextArea)
					{
						sub.textEditorProperties.textFormat = tfm;
					}
				}
			}
		}
		
		//====================layout支持===========================
		/**
		 * @private
		 */
		protected var _layout:ILayout;
		
		/**
		 * Controls the way that the group's children are positioned and sized.
		 *
		 * <p>The following example tells the group to use a horizontal layout:</p>
		 *
		 * <listing version="3.0">
		 * var layout:HorizontalLayout = new HorizontalLayout();
		 * layout.gap = 20;
		 * layout.padding = 20;
		 * container.layout = layout;</listing>
		 *
		 * @default null
		 */
		public function get layout():ILayout
		{
			return this._layout;
		}
		
		/**
		 * @private
		 */
		public function set layout(value:ILayout):void
		{
			if(this._layout == value)
			{
				return;
			}
			this._layout = value;
			if(this._layout)
			{
				if(this._layout is IVirtualLayout)
				{
					IVirtualLayout(this._layout).useVirtualLayout = false;
				}
			}
			
			layoutSkinChildren();
		}
		
		public function layoutSkinChildren(explicitWidth:int=0, explicitHeight:int=0):void
		{
			var len:int = container.numChildren;
			if(len < 1)return;
			
			var layoutItems:Vector.<DisplayObject> = new Vector.<DisplayObject>();
			var i:int;
			while(len--)
			{
				layoutItems[i] = container.getChildAt(len);
				i++;
			}
			if(layout != null)
			{
				var viewBounds:ViewPortBounds = null;
				explicitWidth = explicitWidth || width || this.container.width;
				explicitHeight = explicitHeight || height || this.container.height;
				if(explicitWidth > 0 && explicitHeight > 0)
				{
					viewBounds=  new ViewPortBounds();
					viewBounds.explicitWidth = explicitWidth;
					viewBounds.explicitHeight = explicitHeight;
				}
				if(container is LayoutGroup)
				{
					LayoutGroup(container).layout = layout;
				}
				layout.layout(layoutItems, viewBounds);
			}
		}
		
		private function initDefaultLayout():void
		{
			if(needAnchorLayout && !layout )layout = new AnchorLayout();
		}
		
		public function dispose():void
		{
			var len:int = elementsContent ? elementsContent.length : 0;
			var d:DisplayObject;
			for(var i:int=0; i<len; i++)
			{
				d = elementsContent[i] as DisplayObject;
				if(d != null)d.dispose();
			}
			elementsContent.length = 0;
			elementsContent = null;
			skinNames = null;
			states = null;
		}
	}
}

