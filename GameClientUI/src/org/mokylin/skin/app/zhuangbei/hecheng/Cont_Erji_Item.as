package org.mokylin.skin.app.zhuangbei.hecheng
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.Radio;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.app.zhuangbei.hecheng.button.ButtonErji_bg;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Cont_Erji_Item extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var labelDisplay:feathers.controls.Label;

		public var rdo_btn:feathers.controls.Radio;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Cont_Erji_Item()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [rdo_btn_i(),labelDisplay_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
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