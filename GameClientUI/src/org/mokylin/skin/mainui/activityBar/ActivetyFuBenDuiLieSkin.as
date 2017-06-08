package org.mokylin.skin.mainui.activityBar
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.mainui.activityBar.button.ButtonFubenduilie;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ActivetyFuBenDuiLieSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnBar:feathers.controls.Button;

		public var txtTitle:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ActivetyFuBenDuiLieSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 107;
			this.width = 82;
			this.elementsContent = [btnBar_i(),txtTitle_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function btnBar_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnBar = temp;
			temp.name = "btnBar";
			temp.styleClass = org.mokylin.skin.mainui.activityBar.button.ButtonFubenduilie;
			temp.x = 6;
			temp.y = 0;
			return temp;
		}

		private function txtTitle_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txtTitle = temp;
			temp.name = "txtTitle";
			temp.height = 40;
			temp.touchable = false;
			temp.touchGroup = true;
			temp.leading = 3;
			temp.text = "副本列队中00：30";
			temp.textAlign = "center";
			temp.color = 0x41FF65;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 82;
			temp.x = 0;
			temp.y = 67;
			return temp;
		}

	}
}