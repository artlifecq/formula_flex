package org.mokylin.skin.mainui.duiwu
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.list.ListSkin1;
	import org.mokylin.skin.mainui.duiwu.button.ButtonShang;
	import org.mokylin.skin.mainui.duiwu.button.ButtonTuianniu;
	import org.mokylin.skin.mainui.duiwu.button.ButtonXia;

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

		public var btn_down:feathers.controls.Button;

		public var btn_up:feathers.controls.Button;

		public var lbNum:feathers.controls.Label;

		public var list_head:feathers.controls.List;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function DuiWu_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__DuiWu_Skin_UIAsset1_i(),__DuiWu_Skin_UIAsset2_i(),lbNum_i(),btn_up_i(),btn_down_i(),list_head_i(),btnExit_i()];
			
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
			temp.x = 53;
			temp.y = 5;
			return temp;
		}

		private function btnExit_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnExit = temp;
			temp.name = "btnExit";
			temp.styleClass = org.mokylin.skin.mainui.duiwu.button.ButtonTuianniu;
			temp.x = 8;
			temp.y = 2;
			return temp;
		}

		private function btn_down_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_down = temp;
			temp.name = "btn_down";
			temp.styleClass = org.mokylin.skin.mainui.duiwu.button.ButtonXia;
			temp.x = 211;
			temp.y = 2;
			return temp;
		}

		private function btn_up_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_up = temp;
			temp.name = "btn_up";
			temp.styleClass = org.mokylin.skin.mainui.duiwu.button.ButtonShang;
			temp.x = 211;
			temp.y = 2;
			return temp;
		}

		private function lbNum_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbNum = temp;
			temp.name = "lbNum";
			temp.text = "1/4";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 35;
			temp.x = 156;
			temp.y = 8;
			return temp;
		}

		private function list_head_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			list_head = temp;
			temp.name = "list_head";
			temp.height = 124;
			temp.styleClass = org.mokylin.skin.component.list.ListSkin1;
			temp.width = 244;
			temp.x = 1;
			temp.y = 32;
			return temp;
		}

	}
}