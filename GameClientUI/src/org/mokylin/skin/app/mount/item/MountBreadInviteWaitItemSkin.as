package org.mokylin.skin.app.mount.item
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_mount_btn_erji;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class MountBreadInviteWaitItemSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnNO:feathers.controls.Button;

		public var btnOK:feathers.controls.Button;

		public var itemBg:feathers.controls.UIAsset;

		public var itemSelected:feathers.controls.UIAsset;

		public var labPlayerName:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function MountBreadInviteWaitItemSkin()
		{
			super();
			
			this.currentState = "normal";
			this.width = 270;
			this.elementsContent = [itemBg_i(),itemSelected_i(),labPlayerName_i(),btnOK_i(),btnNO_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function btnNO_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnNO = temp;
			temp.name = "btnNO";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 31;
			temp.label = "拒绝";
			temp.fontSize = 14;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_mount_btn_erji);
			temp.textAlign = "center";
			temp.color = 0xDDDABA;
			temp.width = 60;
			temp.x = 195;
			temp.y = 5;
			return temp;
		}

		private function btnOK_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnOK = temp;
			temp.name = "btnOK";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 31;
			temp.label = "同意";
			temp.fontSize = 14;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_mount_btn_erji);
			temp.textAlign = "center";
			temp.color = 0xDDDABA;
			temp.width = 60;
			temp.x = 130;
			temp.y = 5;
			return temp;
		}

		private function itemBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			itemBg = temp;
			temp.name = "itemBg";
			temp.height = 40;
			temp.styleName = "ui/app/country/niupizhi/lieditiao_xiao.png";
			temp.width = 270;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function itemSelected_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			itemSelected = temp;
			temp.name = "itemSelected";
			temp.height = 40;
			temp.styleName = "ui/common/liebiao/select.png";
			temp.width = 270;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function labPlayerName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labPlayerName = temp;
			temp.name = "labPlayerName";
			temp.bold = false;
			temp.height = 30;
			temp.fontSize = 14;
			temp.text = "玩家名称七个字";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.underline = true;
			temp.width = 130;
			temp.x = 0;
			temp.y = 10;
			return temp;
		}

	}
}