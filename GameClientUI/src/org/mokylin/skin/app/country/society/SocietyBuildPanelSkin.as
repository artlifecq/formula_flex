package org.mokylin.skin.app.country.society
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.TextInput;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_xiao_red;
	import org.mokylin.skin.component.text.TextInput3Skin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class SocietyBuildPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var __SocietyBuildPanelSkin_UIAsset2:feathers.controls.UIAsset;

		public var __SocietyBuildPanelSkin_UIAsset3:feathers.controls.UIAsset;

		public var __SocietyBuildPanelSkin_UIAsset4:feathers.controls.UIAsset;

		public var bangLingCount:feathers.controls.Label;

		public var bangLingGrid:feathers.controls.UIAsset;

		public var biaoJuBtn:feathers.controls.UIAsset;

		public var biaoJu_level:feathers.controls.Label;

		public var contributeValueTxt:feathers.controls.Label;

		public var daTingBtn:feathers.controls.UIAsset;

		public var daTing_level:feathers.controls.Label;

		public var donateGoodsBtn:feathers.controls.Button;

		public var donateGoodsCount:feathers.controls.TextInput;

		public var donateMoneyBtn:feathers.controls.Button;

		public var donateMoneyDingCount:feathers.controls.TextInput;

		public var donateMoneyLiangCount:feathers.controls.TextInput;

		public var goodsNameTxt:feathers.controls.Label;

		public var hasBangLingCount:feathers.controls.Label;

		public var hasBangLingCountGrid:feathers.controls.UIAsset;

		public var hasMoneyCount:feathers.controls.Label;

		public var hasMoneyGrid:feathers.controls.UIAsset;

		public var moneyCount:feathers.controls.Label;

		public var moneyGrid:feathers.controls.UIAsset;

		public var shouLanBtn:feathers.controls.UIAsset;

		public var shouLan_level:feathers.controls.Label;

		public var shuYuanBtn:feathers.controls.UIAsset;

		public var shuYuan_level:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function SocietyBuildPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 496;
			this.width = 883;
			this.elementsContent = [__SocietyBuildPanelSkin_UIAsset1_i(),__SocietyBuildPanelSkin_UIAsset3_i(),donateGoodsBtn_i(),donateMoneyBtn_i(),__SocietyBuildPanelSkin_UIAsset5_i(),daTingBtn_i(),biaoJuBtn_i(),shouLanBtn_i(),shuYuanBtn_i(),__SocietyBuildPanelSkin_UIAsset6_i(),__SocietyBuildPanelSkin_UIAsset7_i(),__SocietyBuildPanelSkin_UIAsset8_i(),__SocietyBuildPanelSkin_Label1_i(),__SocietyBuildPanelSkin_Label2_i(),biaoJu_level_i(),daTing_level_i(),shouLan_level_i(),shuYuan_level_i(),__SocietyBuildPanelSkin_UIAsset9_i(),bangLingGrid_i(),goodsNameTxt_i(),bangLingCount_i(),__SocietyBuildPanelSkin_UIAsset10_i(),__SocietyBuildPanelSkin_Label3_i(),moneyCount_i(),__SocietyBuildPanelSkin_UIAsset11_i(),__SocietyBuildPanelSkin_UIAsset12_i(),hasBangLingCountGrid_i(),__SocietyBuildPanelSkin_Label4_i(),__SocietyBuildPanelSkin_Label5_i(),__SocietyBuildPanelSkin_Label6_i(),__SocietyBuildPanelSkin_Label7_i(),__SocietyBuildPanelSkin_Label8_i(),hasBangLingCount_i(),__SocietyBuildPanelSkin_Label9_i(),__SocietyBuildPanelSkin_Label10_i(),__SocietyBuildPanelSkin_Label11_i(),hasMoneyCount_i(),__SocietyBuildPanelSkin_Label12_i(),__SocietyBuildPanelSkin_Label13_i(),donateGoodsCount_i(),donateMoneyDingCount_i(),donateMoneyLiangCount_i(),__SocietyBuildPanelSkin_UIAsset13_i(),contributeValueTxt_i(),hasMoneyGrid_i(),moneyGrid_i()];
			__SocietyBuildPanelSkin_UIAsset2_i();
			__SocietyBuildPanelSkin_UIAsset4_i();
			
			
			states = {
			};
			skinNames={"disabled":"ui/common/kang/shurukuang/shurukuang.png,ui/common/kang/shurukuang/shurukuang.png", "enabled":"ui/common/kang/shurukuang/shurukuang.png,ui/common/kang/shurukuang/shurukuang.png", "focused":"ui/common/kang/shurukuang/shurukuang.png,ui/common/kang/shurukuang/shurukuang.png"};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __SocietyBuildPanelSkin_Label10_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 22;
			temp.fontSize = 14;
			temp.text = "锭";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.width = 24;
			temp.x = 729;
			temp.y = 298;
			return temp;
		}

		private function __SocietyBuildPanelSkin_Label11_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 22;
			temp.fontSize = 14;
			temp.text = "两";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.width = 24;
			temp.x = 825;
			temp.y = 298;
			return temp;
		}

		private function __SocietyBuildPanelSkin_Label12_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 22;
			temp.fontSize = 12;
			temp.text = "1两银子=个人贡献+10";
			temp.textAlign = "center";
			temp.color = 0x1F9A0F;
			temp.width = 150;
			temp.x = 678;
			temp.y = 366;
			return temp;
		}

		private function __SocietyBuildPanelSkin_Label13_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 22;
			temp.fontSize = 12;
			temp.text = "1个令牌=个人贡献+10";
			temp.textAlign = "center";
			temp.color = 0x1F9A0F;
			temp.width = 150;
			temp.x = 444;
			temp.y = 366;
			return temp;
		}

		private function __SocietyBuildPanelSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "家族资源";
			temp.textAlign = "center";
			temp.color = 0xC4A689;
			temp.width = 108;
			temp.x = 578;
			temp.y = 17;
			return temp;
		}

		private function __SocietyBuildPanelSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "捐献";
			temp.textAlign = "center";
			temp.color = 0xC4A689;
			temp.width = 108;
			temp.x = 578;
			temp.y = 141;
			return temp;
		}

		private function __SocietyBuildPanelSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 22;
			temp.fontSize = 14;
			temp.text = "家族资金";
			temp.textAlign = "left";
			temp.color = 0xF4BD63;
			temp.width = 150;
			temp.x = 709;
			temp.y = 60;
			return temp;
		}

		private function __SocietyBuildPanelSkin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 22;
			temp.fontSize = 14;
			temp.text = "拥有数量";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.width = 130;
			temp.x = 482;
			temp.y = 202;
			return temp;
		}

		private function __SocietyBuildPanelSkin_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 22;
			temp.fontSize = 14;
			temp.text = "捐献数量";
			temp.textAlign = "left";
			temp.color = 0xF4BD63;
			temp.width = 150;
			temp.x = 415;
			temp.y = 268;
			return temp;
		}

		private function __SocietyBuildPanelSkin_Label6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 22;
			temp.fontSize = 12;
			temp.text = "家族资源可用于提升家族建筑等级，个人贡献可用于学习家族技能";
			temp.textAlign = "left";
			temp.color = 0xF4BD63;
			temp.width = 380;
			temp.x = 456;
			temp.y = 468;
			return temp;
		}

		private function __SocietyBuildPanelSkin_Label7_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "点击建筑物查看建筑升级详情";
			temp.textAlign = "left";
			temp.color = 0xF6D621;
			temp.underline = true;
			temp.width = 200;
			temp.x = 12;
			temp.y = 460;
			return temp;
		}

		private function __SocietyBuildPanelSkin_Label8_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 22;
			temp.fontSize = 14;
			temp.text = "捐献数量";
			temp.textAlign = "left";
			temp.color = 0xF4BD63;
			temp.width = 150;
			temp.x = 648;
			temp.y = 268;
			return temp;
		}

		private function __SocietyBuildPanelSkin_Label9_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 22;
			temp.fontSize = 14;
			temp.text = "拥有银两";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.width = 130;
			temp.x = 716;
			temp.y = 202;
			return temp;
		}

		private function __SocietyBuildPanelSkin_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 73;
			temp.styleName = "ui/common/kang/tubiaodikuang_1.png";
			temp.width = 233;
			temp.x = 635;
			temp.y = 50;
			return temp;
		}

		private function __SocietyBuildPanelSkin_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/kang/tu_biao_di.png";
			temp.x = 418;
			temp.y = 200;
			return temp;
		}

		private function __SocietyBuildPanelSkin_UIAsset12_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/kang/tu_biao_di.png";
			temp.x = 652;
			temp.y = 200;
			return temp;
		}

		private function __SocietyBuildPanelSkin_UIAsset13_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/bangpai/gerengongxian.png";
			temp.x = 490;
			temp.y = 402;
			return temp;
		}

		private function __SocietyBuildPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 212;
			temp.styleName = "ui/common/kang/tu_biao_di_kuang.png";
			temp.width = 233;
			temp.x = 402;
			temp.y = 180;
			return temp;
		}

		private function __SocietyBuildPanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__SocietyBuildPanelSkin_UIAsset2 = temp;
			temp.height = 73;
			temp.styleName = "ui/common/kang/shurukuang/shurukuang.png";
			temp.width = 210;
			temp.x = 413;
			temp.y = 192;
			return temp;
		}

		private function __SocietyBuildPanelSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__SocietyBuildPanelSkin_UIAsset3 = temp;
			temp.height = 212;
			temp.styleName = "ui/common/kang/tu_biao_di_kuang.png";
			temp.width = 233;
			temp.x = 635;
			temp.y = 180;
			return temp;
		}

		private function __SocietyBuildPanelSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__SocietyBuildPanelSkin_UIAsset4 = temp;
			temp.height = 73;
			temp.styleName = "ui/common/kang/shurukuang/shurukuang.png";
			temp.width = 210;
			temp.x = 647;
			temp.y = 192;
			return temp;
		}

		private function __SocietyBuildPanelSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/societyBuild_bg.jpg";
			temp.x = 6;
			temp.y = 6;
			return temp;
		}

		private function __SocietyBuildPanelSkin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/bangpai/biaotikuang.png";
			temp.x = 396;
			temp.y = 8;
			return temp;
		}

		private function __SocietyBuildPanelSkin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/bangpai/biaotikuang.png";
			temp.x = 396;
			temp.y = 132;
			return temp;
		}

		private function __SocietyBuildPanelSkin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/bangpai/di.png";
			temp.x = 393;
			temp.y = 403;
			return temp;
		}

		private function __SocietyBuildPanelSkin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 73;
			temp.styleName = "ui/common/kang/tubiaodikuang_1.png";
			temp.width = 233;
			temp.x = 402;
			temp.y = 50;
			return temp;
		}

		private function bangLingCount_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			bangLingCount = temp;
			temp.name = "bangLingCount";
			temp.bold = false;
			temp.height = 22;
			temp.fontSize = 14;
			temp.text = "10000";
			temp.textAlign = "left";
			temp.color = 0x1F9A0F;
			temp.width = 150;
			temp.x = 476;
			temp.y = 85;
			return temp;
		}

		private function bangLingGrid_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bangLingGrid = temp;
			temp.name = "bangLingGrid";
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.x = 414;
			temp.y = 60;
			return temp;
		}

		private function biaoJuBtn_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			biaoJuBtn = temp;
			temp.name = "biaoJuBtn";
			temp.styleName = "ui/app/country/bangpai/biaoju.png";
			temp.x = 110;
			temp.y = 110;
			return temp;
		}

		private function biaoJu_level_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			biaoJu_level = temp;
			temp.name = "biaoJu_level";
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "10级";
			temp.textAlign = "center";
			temp.color = 0x1F9A0F;
			temp.nativeFilters = Fontter.filterObj["textFilterBlack"];
			temp.width = 108;
			temp.x = 129;
			temp.y = 149;
			return temp;
		}

		private function contributeValueTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			contributeValueTxt = temp;
			temp.name = "contributeValueTxt";
			temp.bold = false;
			temp.height = 28;
			temp.fontSize = 18;
			temp.text = "9999";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.width = 150;
			temp.x = 616;
			temp.y = 430;
			return temp;
		}

		private function daTingBtn_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			daTingBtn = temp;
			temp.name = "daTingBtn";
			temp.styleName = "ui/app/country/bangpai/dating.png";
			temp.x = 112;
			temp.y = 30;
			return temp;
		}

		private function daTing_level_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			daTing_level = temp;
			temp.name = "daTing_level";
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "10级";
			temp.textAlign = "center";
			temp.color = 0x1F9A0F;
			temp.nativeFilters = Fontter.filterObj["textFilterBlack"];
			temp.width = 108;
			temp.x = 132;
			temp.y = 70;
			return temp;
		}

		private function donateGoodsBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			donateGoodsBtn = temp;
			temp.name = "donateGoodsBtn";
			temp.height = 24;
			temp.label = "捐  献";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_xiao_red);
			temp.width = 57;
			temp.x = 490;
			temp.y = 328;
			return temp;
		}

		private function donateGoodsCount_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			donateGoodsCount = temp;
			temp.name = "donateGoodsCount";
			temp.height = 23;
			temp.maxChars = 8;
			temp.restrict = "0-9";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.text.TextInput3Skin);
			temp.text = "1000";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 130;
			temp.x = 454;
			temp.y = 296;
			return temp;
		}

		private function donateMoneyBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			donateMoneyBtn = temp;
			temp.name = "donateMoneyBtn";
			temp.height = 24;
			temp.label = "捐  献";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_xiao_red);
			temp.width = 57;
			temp.x = 722;
			temp.y = 328;
			return temp;
		}

		private function donateMoneyDingCount_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			donateMoneyDingCount = temp;
			temp.name = "donateMoneyDingCount";
			temp.height = 23;
			temp.maxChars = 8;
			temp.restrict = "0-9";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.text.TextInput3Skin);
			temp.text = "1000";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 70;
			temp.x = 656;
			temp.y = 296;
			return temp;
		}

		private function donateMoneyLiangCount_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			donateMoneyLiangCount = temp;
			temp.name = "donateMoneyLiangCount";
			temp.height = 23;
			temp.maxChars = 8;
			temp.restrict = "0-9";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.text.TextInput3Skin);
			temp.text = "1000";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 70;
			temp.x = 752;
			temp.y = 296;
			return temp;
		}

		private function goodsNameTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			goodsNameTxt = temp;
			temp.name = "goodsNameTxt";
			temp.bold = false;
			temp.height = 22;
			temp.fontSize = 14;
			temp.text = "家族令名称";
			temp.textAlign = "left";
			temp.color = 0xF4BD63;
			temp.width = 150;
			temp.x = 476;
			temp.y = 60;
			return temp;
		}

		private function hasBangLingCountGrid_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			hasBangLingCountGrid = temp;
			temp.name = "hasBangLingCountGrid";
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.x = 420;
			temp.y = 202;
			return temp;
		}

		private function hasBangLingCount_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			hasBangLingCount = temp;
			temp.name = "hasBangLingCount";
			temp.bold = false;
			temp.height = 22;
			temp.fontSize = 14;
			temp.text = "10000";
			temp.textAlign = "left";
			temp.color = 0x1F9A0F;
			temp.width = 130;
			temp.x = 482;
			temp.y = 227;
			return temp;
		}

		private function hasMoneyCount_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			hasMoneyCount = temp;
			temp.name = "hasMoneyCount";
			temp.bold = false;
			temp.height = 22;
			temp.fontSize = 14;
			temp.text = "10000";
			temp.textAlign = "left";
			temp.color = 0x1F9A0F;
			temp.width = 130;
			temp.x = 716;
			temp.y = 227;
			return temp;
		}

		private function hasMoneyGrid_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			hasMoneyGrid = temp;
			temp.name = "hasMoneyGrid";
			temp.styleName = "ui/common/tubiao/yinzi_46.png";
			temp.x = 657;
			temp.y = 206;
			return temp;
		}

		private function moneyCount_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			moneyCount = temp;
			temp.name = "moneyCount";
			temp.bold = false;
			temp.height = 22;
			temp.fontSize = 14;
			temp.text = "10000";
			temp.textAlign = "left";
			temp.color = 0x1F9A0F;
			temp.width = 150;
			temp.x = 709;
			temp.y = 85;
			return temp;
		}

		private function moneyGrid_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			moneyGrid = temp;
			temp.name = "moneyGrid";
			temp.styleName = "ui/common/tubiao/yinzi_46.png";
			temp.x = 650;
			temp.y = 64;
			return temp;
		}

		private function shouLanBtn_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			shouLanBtn = temp;
			temp.name = "shouLanBtn";
			temp.styleName = "ui/app/country/bangpai/shoulan.png";
			temp.x = 8;
			temp.y = 250;
			return temp;
		}

		private function shouLan_level_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			shouLan_level = temp;
			temp.name = "shouLan_level";
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "10级";
			temp.textAlign = "center";
			temp.color = 0x1F9A0F;
			temp.nativeFilters = Fontter.filterObj["textFilterBlack"];
			temp.width = 108;
			temp.x = 28;
			temp.y = 288;
			return temp;
		}

		private function shuYuanBtn_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			shuYuanBtn = temp;
			temp.name = "shuYuanBtn";
			temp.styleName = "ui/app/country/bangpai/shuyuan.png";
			temp.x = 125;
			temp.y = 269;
			return temp;
		}

		private function shuYuan_level_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			shuYuan_level = temp;
			temp.name = "shuYuan_level";
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "10级";
			temp.textAlign = "center";
			temp.color = 0x1F9A0F;
			temp.nativeFilters = Fontter.filterObj["textFilterBlack"];
			temp.width = 108;
			temp.x = 143;
			temp.y = 307;
			return temp;
		}

	}
}