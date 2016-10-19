package org.mokylin.skin.app.shop
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Check;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_mount_btn_erji;
	import org.mokylin.skin.component.button.ButtonV3_g_guanbi;
	import org.mokylin.skin.component.check.CheckBoxSkin_4;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ShopSellPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var btnBuy:feathers.controls.Button;

		public var btnCancel:feathers.controls.Button;

		public var btnClose:feathers.controls.Button;

		public var cbTip:feathers.controls.Check;

		public var grid:feathers.controls.UIAsset;

		public var lbName:feathers.controls.Label;

		public var lbTip:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ShopSellPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [bg_i(),lbTip_i(),lbName_i(),btnClose_i(),__ShopSellPanelSkin_Label1_i(),btnBuy_i(),btnCancel_i(),cbTip_i(),grid_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __ShopSellPanelSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = true;
			temp.height = 18;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.touchable = false;
			temp.fontSize = 14;
			temp.text = "出 售";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 88;
			temp.x = 125;
			temp.y = 14;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 263;
			temp.styleName = "ui/common/version_3/T_tongyongbanzi/er_ji_mian_ban.png";
			temp.width = 339;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnBuy_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnBuy = temp;
			temp.name = "btnBuy";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 36;
			temp.label = "出 售";
			temp.letterSpacing = 0;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_mount_btn_erji;
			temp.color = 0xF9F0CC;
			temp.width = 106;
			temp.x = 43;
			temp.y = 207;
			return temp;
		}

		private function btnCancel_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnCancel = temp;
			temp.name = "btnCancel";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 36;
			temp.label = "取 消";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_mount_btn_erji;
			temp.color = 0xF9F0CC;
			temp.width = 106;
			temp.x = 186;
			temp.y = 207;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_g_guanbi;
			temp.x = 308;
			temp.y = 3;
			return temp;
		}

		private function cbTip_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			cbTip = temp;
			temp.name = "cbTip";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 22;
			temp.label = "今日不再提示";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_4;
			temp.textAlign = "left";
			temp.color = 0xCAAF94;
			temp.width = 117;
			temp.x = 49;
			temp.y = 167;
			return temp;
		}

		private function grid_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid = temp;
			temp.name = "grid";
			temp.styleName = "ui/common/version_3/T_tubiaodikuang/tu_biao_kuang.png";
			temp.x = 142;
			temp.y = 77;
			return temp;
		}

		private function lbName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName = temp;
			temp.name = "lbName";
			temp.text = "名字";
			temp.textAlign = "center";
			temp.color = 0xE9C099;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 253;
			temp.x = 43;
			temp.y = 51;
			return temp;
		}

		private function lbTip_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTip = temp;
			temp.name = "lbTip";
			temp.htmlText = "这件物品价值非常，你确定要出售吗?";
			temp.textAlign = "center";
			temp.color = 0xE9C099;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 253;
			temp.x = 41;
			temp.y = 139;
			return temp;
		}

	}
}