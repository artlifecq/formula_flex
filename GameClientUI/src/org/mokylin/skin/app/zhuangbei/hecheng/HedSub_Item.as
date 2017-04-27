package org.mokylin.skin.app.zhuangbei.hecheng
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.Radio;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.app.zhuangbei.hecheng.button.ButtonErji_bg;
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


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function HedSub_Item()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [rdo_btn_i(),labelDisplay_i(),btnFlag_i()];
			
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
			temp.x = 37;
			temp.y = 10;
			return temp;
		}

		private function labelDisplay_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labelDisplay = temp;
			temp.name = "labelDisplay";
			temp.htmlText = "中级鉴定图纸<font color='#bea757'>(10)</font>";
			temp.textAlign = "center";
			temp.color = 0xE1D4A9;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 238;
			temp.x = 5;
			temp.y = 8;
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
			temp.styleClass = org.mokylin.skin.app.zhuangbei.hecheng.button.ButtonErji_bg;
			temp.color = 0xE1D4A9;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}