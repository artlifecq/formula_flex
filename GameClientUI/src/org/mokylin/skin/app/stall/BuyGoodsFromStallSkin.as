package org.mokylin.skin.app.stall
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.TextInput;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonV3_e_erjianniu;
	import org.mokylin.skin.component.button.ButtonV3_g_guanbi;
	import org.mokylin.skin.component.button.ButtonV3_g_you;
	import org.mokylin.skin.component.button.ButtonV3_g_zuo;
	import org.mokylin.skin.component.button.ButtonV3_s_sanjixiaoanniu;
	import org.mokylin.skin.component.text.TextInputSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class BuyGoodsFromStallSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnClose:feathers.controls.Button;

		public var grid:feathers.controls.UIAsset;

		public var itemName:feathers.controls.Label;

		public var left:feathers.controls.Button;

		public var level:feathers.controls.Label;

		public var max:feathers.controls.Button;

		public var right:feathers.controls.Button;

		public var sellGoods:feathers.controls.Button;

		public var sellGoodsNum:feathers.controls.TextInput;

		public var sellGoodsPrice:feathers.controls.Label;

		public var sellGoodsTotal:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function BuyGoodsFromStallSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__BuyGoodsFromStallSkin_UIAsset1_i(),__BuyGoodsFromStallSkin_UIAsset2_i(),__BuyGoodsFromStallSkin_UIAsset3_i(),sellGoodsNum_i(),itemName_i(),btnClose_i(),__BuyGoodsFromStallSkin_Label1_i(),grid_i(),__BuyGoodsFromStallSkin_Label2_i(),__BuyGoodsFromStallSkin_Label3_i(),__BuyGoodsFromStallSkin_Label4_i(),__BuyGoodsFromStallSkin_Label5_i(),__BuyGoodsFromStallSkin_Label6_i(),sellGoodsTotal_i(),sellGoodsPrice_i(),level_i(),sellGoods_i(),left_i(),right_i(),max_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __BuyGoodsFromStallSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.touchable = false;
			temp.touchGroup = false;
			temp.text = "购买物品";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 115;
			temp.y = 11;
			return temp;
		}

		private function __BuyGoodsFromStallSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 14;
			temp.text = "购买数量:";
			temp.textAlign = "left";
			temp.color = 0xF4BD63;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 23;
			temp.y = 120;
			return temp;
		}

		private function __BuyGoodsFromStallSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 14;
			temp.text = "购买单价:";
			temp.textAlign = "left";
			temp.color = 0xF4BD63;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 23;
			temp.y = 149;
			return temp;
		}

		private function __BuyGoodsFromStallSkin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 14;
			temp.text = "（银两）";
			temp.textAlign = "left";
			temp.color = 0xD4C996;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 86;
			temp.y = 149;
			return temp;
		}

		private function __BuyGoodsFromStallSkin_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 14;
			temp.text = "（银两）";
			temp.textAlign = "left";
			temp.color = 0xD4C996;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 86;
			temp.y = 201;
			return temp;
		}

		private function __BuyGoodsFromStallSkin_Label6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 14;
			temp.text = "购买总价:";
			temp.textAlign = "left";
			temp.color = 0xF4BD63;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 23;
			temp.y = 201;
			return temp;
		}

		private function __BuyGoodsFromStallSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 314;
			temp.styleName = "ui/common/version_3/T_tongyongbanzi/er_ji_mian_ban.png";
			temp.width = 296;
			temp.x = -3;
			temp.y = -4;
			return temp;
		}

		private function __BuyGoodsFromStallSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 216;
			temp.styleName = "ui/common/version_3/S_shurukuang/shu_ru_kuang_2.png";
			temp.width = 264;
			temp.x = 14;
			temp.y = 36;
			return temp;
		}

		private function __BuyGoodsFromStallSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 69;
			temp.styleName = "ui/common/version_3/S_shurukuang/shu_ru_kuang_2.png";
			temp.width = 260;
			temp.x = 16;
			temp.y = 38;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_g_guanbi;
			temp.x = 260;
			temp.y = 2;
			return temp;
		}

		private function grid_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid = temp;
			temp.name = "grid";
			temp.styleName = "ui/common/grid/normal/46_3.png";
			temp.x = 22;
			temp.y = 44;
			return temp;
		}

		private function itemName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			itemName = temp;
			temp.name = "itemName";
			temp.fontSize = 14;
			temp.text = "轻效";
			temp.textAlign = "left";
			temp.color = 0xE9C099;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 163;
			temp.x = 105;
			temp.y = 52;
			return temp;
		}

		private function left_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			left = temp;
			temp.name = "left";
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_g_zuo;
			temp.x = 94;
			temp.y = 119;
			return temp;
		}

		private function level_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			level = temp;
			temp.name = "level";
			temp.fontSize = 14;
			temp.text = "99";
			temp.textAlign = "left";
			temp.color = 0xE9C099;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 123;
			temp.x = 105;
			temp.y = 75;
			return temp;
		}

		private function max_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			max = temp;
			temp.name = "max";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "最大";
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_s_sanjixiaoanniu;
			temp.color = 0xF9F0CC;
			temp.x = 210;
			temp.y = 117;
			return temp;
		}

		private function right_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			right = temp;
			temp.name = "right";
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_g_you;
			temp.x = 192;
			temp.y = 119;
			return temp;
		}

		private function sellGoodsNum_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			sellGoodsNum = temp;
			temp.name = "sellGoodsNum";
			temp.height = 20;
			temp.styleClass = org.mokylin.skin.component.text.TextInputSkin;
			temp.textAlign = "center";
			temp.width = 118;
			temp.x = 93;
			temp.y = 118;
			return temp;
		}

		private function sellGoodsPrice_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			sellGoodsPrice = temp;
			temp.name = "sellGoodsPrice";
			temp.fontSize = 16;
			temp.text = "xxx锭 xx两 xx文";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 191;
			temp.x = 74;
			temp.y = 170;
			return temp;
		}

		private function sellGoodsTotal_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			sellGoodsTotal = temp;
			temp.name = "sellGoodsTotal";
			temp.fontSize = 16;
			temp.text = "xxx锭 xx两 xx文";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 191;
			temp.x = 74;
			temp.y = 220;
			return temp;
		}

		private function sellGoods_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			sellGoods = temp;
			temp.name = "sellGoods";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "购买物品";
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_e_erjianniu;
			temp.color = 0xF9F0CC;
			temp.width = 90;
			temp.x = 99;
			temp.y = 256;
			return temp;
		}

	}
}