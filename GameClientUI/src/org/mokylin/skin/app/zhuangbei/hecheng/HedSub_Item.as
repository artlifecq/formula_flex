package org.mokylin.skin.app.zhuangbei.hecheng
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.Radio;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.zhuangbei.hecheng.button.ButtonHechengErji;
	import org.mokylin.skin.app.zhuangbei.hecheng.button.ButtonSanjiao_right;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class HedSub_Item extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnFlag:feathers.controls.Button;

		public var labelDisplay:feathers.controls.Label;

		public var rdo_btn:feathers.controls.Radio;

		public var ui_tishi:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function HedSub_Item()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [rdo_btn_i(),labelDisplay_i(),btnFlag_i(),ui_tishi_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function btnFlag_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnFlag = temp;
			temp.name = "btnFlag";
			temp.styleClass = org.mokylin.skin.app.zhuangbei.hecheng.button.ButtonSanjiao_right;
			temp.x = 201;
			temp.y = 9;
			return temp;
		}

		private function labelDisplay_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labelDisplay = temp;
			temp.name = "labelDisplay";
			temp.htmlText = "中级鉴定图纸<font color='#bea757'>(10)</font>";
			temp.textAlign = "left";
			temp.color = 0xE1D4A9;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 210;
			temp.x = 25;
			temp.y = 6;
			return temp;
		}

		private function rdo_btn_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			rdo_btn = temp;
			temp.name = "rdo_btn";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.labelOffsetY = -2;
			temp.isSelected = false;
			temp.styleClass = org.mokylin.skin.app.zhuangbei.hecheng.button.ButtonHechengErji;
			temp.color = 0xE1D4A9;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function ui_tishi_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ui_tishi = temp;
			temp.name = "ui_tishi";
			temp.styleName = "ui/common/tubiao/tishi.png";
			temp.x = 225;
			temp.y = 5;
			return temp;
		}

	}
}