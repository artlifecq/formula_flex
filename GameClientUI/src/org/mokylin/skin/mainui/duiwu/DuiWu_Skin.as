package org.mokylin.skin.mainui.duiwu
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_shouhui;
	import org.mokylin.skin.component.button.ButtonSkin_zhankai;
	import org.mokylin.skin.mainui.duiwu.button.ButtonTuianniu;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class DuiWu_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnExit:feathers.controls.Button;

		public var btn_close:feathers.controls.Button;

		public var btn_open:feathers.controls.Button;

		public var lbNum:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function DuiWu_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 123;
			this.elementsContent = [__DuiWu_Skin_UIAsset1_i(),__DuiWu_Skin_UIAsset2_i(),lbNum_i(),btnExit_i(),btn_open_i(),btn_close_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __DuiWu_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/duiwu/ban.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __DuiWu_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/duiwu/duiwu.png";
			temp.x = 25;
			temp.y = 5;
			return temp;
		}

		private function btnExit_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnExit = temp;
			temp.name = "btnExit";
			temp.styleClass = org.mokylin.skin.mainui.duiwu.button.ButtonTuianniu;
			temp.x = 0;
			temp.y = -38;
			return temp;
		}

		private function btn_close_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_close = temp;
			temp.name = "btn_close";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_shouhui;
			temp.visible = false;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btn_open_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_open = temp;
			temp.name = "btn_open";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_zhankai;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function lbNum_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbNum = temp;
			temp.name = "lbNum";
			temp.text = "1/4";
			temp.textAlign = "center";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 35;
			temp.x = 159;
			temp.y = 8;
			return temp;
		}

	}
}