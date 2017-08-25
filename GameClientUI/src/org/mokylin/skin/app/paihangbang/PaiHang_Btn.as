package org.mokylin.skin.app.paihangbang
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.ToggleButton;
	import org.mokylin.skin.app.paihangbang.button.ButtonBtnBase;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class PaiHang_Btn extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn:feathers.controls.ToggleButton;

		public var labelDisplay:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function PaiHang_Btn()
		{
			super();
			
			this.currentState = "normal";
			this.height = 42;
			this.width = 149;
			this.elementsContent = [btn_i(),labelDisplay_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function btn_i():feathers.controls.ToggleButton
		{
			var temp:feathers.controls.ToggleButton = new feathers.controls.ToggleButton();
			btn = temp;
			temp.name = "btn";
			temp.styleClass = org.mokylin.skin.app.paihangbang.button.ButtonBtnBase;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function labelDisplay_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labelDisplay = temp;
			temp.name = "labelDisplay";
			temp.height = 42;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.fontSize = 14;
			temp.text = "按 钮";
			temp.textAlign = "center";
			temp.color = 0xA3A594;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.verticalAlign = "middle";
			temp.width = 149;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}