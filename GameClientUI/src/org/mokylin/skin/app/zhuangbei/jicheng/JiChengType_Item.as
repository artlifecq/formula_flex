package org.mokylin.skin.app.zhuangbei.jicheng
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.ToggleButton;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.radio.RadioButtonSkin_1;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class JiChengType_Item extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var labelDisplay:feathers.controls.Label;

		public var rdo_type:feathers.controls.ToggleButton;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function JiChengType_Item()
		{
			super();
			
			this.currentState = "normal";
			this.height = 27;
			this.width = 520;
			this.elementsContent = [__JiChengType_Item_UIAsset1_i(),rdo_type_i(),labelDisplay_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __JiChengType_Item_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhuangbei/jicheng/wenzitiao.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function labelDisplay_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labelDisplay = temp;
			temp.name = "labelDisplay";
			temp.htmlText = "强化等级：<font color='#cfc6ae'>1</font><font color='#5DBD37'>(+3)</font>";
			temp.color = 0xBEA757;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 170;
			temp.x = 333;
			temp.y = 4;
			return temp;
		}

		private function rdo_type_i():feathers.controls.ToggleButton
		{
			var temp:feathers.controls.ToggleButton = new feathers.controls.ToggleButton();
			rdo_type = temp;
			temp.name = "rdo_type";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "选择强化继承";
			temp.labelOffsetX = 0;
			temp.styleClass = org.mokylin.skin.component.radio.RadioButtonSkin_1;
			temp.textAlign = "left";
			temp.color = 0xCFC6AE;
			temp.width = 154;
			temp.x = 8;
			temp.y = 3;
			return temp;
		}

	}
}