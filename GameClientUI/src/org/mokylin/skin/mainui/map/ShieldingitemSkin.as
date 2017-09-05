package org.mokylin.skin.mainui.map
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.ToggleButton;
	import org.mokylin.skin.component.check.CheckBoxSkin_1;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ShieldingitemSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn_shield:feathers.controls.ToggleButton;

		public var labelDisplay:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ShieldingitemSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 23;
			this.width = 218;
			this.elementsContent = [btn_shield_i(),labelDisplay_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function btn_shield_i():feathers.controls.ToggleButton
		{
			var temp:feathers.controls.ToggleButton = new feathers.controls.ToggleButton();
			btn_shield = temp;
			temp.name = "btn_shield";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.textAlign = "left";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function labelDisplay_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labelDisplay = temp;
			temp.name = "labelDisplay";
			temp.height = 18;
			temp.text = "屏蔽场景特效";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 160;
			temp.x = 26;
			temp.y = 2;
			return temp;
		}

	}
}