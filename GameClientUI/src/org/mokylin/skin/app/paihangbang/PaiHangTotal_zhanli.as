package org.mokylin.skin.app.paihangbang
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.paihangbang.PaiHang_Right;
	import org.mokylin.skin.common.Flip2_Skin;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class PaiHangTotal_zhanli extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnLinQu:feathers.controls.Button;

		public var cellgroup:feathers.controls.Group;

		public var icon1:feathers.controls.UIAsset;

		public var lbMiaosu:feathers.controls.Label;

		public var lbMsg:feathers.controls.Label;

		public var skinFlip:feathers.controls.SkinnableContainer;

		public var skinRight:feathers.controls.SkinnableContainer;

		public var uiLevel:feathers.controls.UIAsset;

		public var uiLevelName:feathers.controls.UIAsset;

		public var uiTongjizhong:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function PaiHangTotal_zhanli()
		{
			super();
			
			this.currentState = "normal";
			this.height = 537;
			this.width = 917;
			this.elementsContent = [__PaiHangTotal_zhanli_UIAsset1_i(),cellgroup_i(),skinFlip_i(),btnLinQu_i(),__PaiHangTotal_zhanli_UIAsset12_i(),__PaiHangTotal_zhanli_UIAsset13_i(),icon1_i(),uiLevel_i(),uiLevelName_i(),__PaiHangTotal_zhanli_Label1_i(),lbMsg_i(),__PaiHangTotal_zhanli_Group1_i(),__PaiHangTotal_zhanli_Group2_i(),uiTongjizhong_i(),lbMiaosu_i(),skinRight_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __PaiHangTotal_zhanli_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 0;
			temp.y = 339;
			temp.elementsContent = [__PaiHangTotal_zhanli_UIAsset14_i(),__PaiHangTotal_zhanli_UIAsset15_i()];
			return temp;
		}

		private function __PaiHangTotal_zhanli_Group2_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 0;
			temp.y = 33;
			temp.elementsContent = [__PaiHangTotal_zhanli_UIAsset16_i(),__PaiHangTotal_zhanli_UIAsset17_i(),__PaiHangTotal_zhanli_UIAsset18_i(),__PaiHangTotal_zhanli_UIAsset19_i(),__PaiHangTotal_zhanli_UIAsset20_i(),__PaiHangTotal_zhanli_UIAsset21_i(),__PaiHangTotal_zhanli_UIAsset22_i(),__PaiHangTotal_zhanli_UIAsset23_i(),__PaiHangTotal_zhanli_UIAsset24_i(),__PaiHangTotal_zhanli_UIAsset25_i()];
			return temp;
		}

		private function __PaiHangTotal_zhanli_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "(今日可领取昨日的段位奖励)";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 224;
			temp.y = 456;
			return temp;
		}

		private function __PaiHangTotal_zhanli_UIAsset12_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/word/zuoripaiwei.png";
			temp.x = 36;
			temp.y = 456;
			return temp;
		}

		private function __PaiHangTotal_zhanli_UIAsset13_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/word/meiripaiwei.png";
			temp.x = 36;
			temp.y = 502;
			return temp;
		}

		private function __PaiHangTotal_zhanli_UIAsset14_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/titilebg/wenzikuang.png";
			temp.width = 546;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __PaiHangTotal_zhanli_UIAsset15_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/word/wodepaiming.png";
			temp.x = 245;
			temp.y = 4;
			return temp;
		}

		private function __PaiHangTotal_zhanli_UIAsset16_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 75;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __PaiHangTotal_zhanli_UIAsset17_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 185;
			temp.x = 75;
			temp.y = 0;
			return temp;
		}

		private function __PaiHangTotal_zhanli_UIAsset18_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 72;
			temp.x = 260;
			temp.y = 0;
			return temp;
		}

		private function __PaiHangTotal_zhanli_UIAsset19_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 74;
			temp.x = 332;
			temp.y = 0;
			return temp;
		}

		private function __PaiHangTotal_zhanli_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/bg1.png";
			temp.x = 0;
			temp.y = 426;
			return temp;
		}

		private function __PaiHangTotal_zhanli_UIAsset20_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 140;
			temp.x = 406;
			temp.y = 0;
			return temp;
		}

		private function __PaiHangTotal_zhanli_UIAsset21_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/word/paiming.png";
			temp.x = 25;
			temp.y = 5;
			return temp;
		}

		private function __PaiHangTotal_zhanli_UIAsset22_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/word/xingming.png";
			temp.x = 148;
			temp.y = 5;
			return temp;
		}

		private function __PaiHangTotal_zhanli_UIAsset23_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/word/dengji.png";
			temp.x = 279;
			temp.y = 5;
			return temp;
		}

		private function __PaiHangTotal_zhanli_UIAsset24_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/word/zhiye.png";
			temp.x = 352;
			temp.y = 5;
			return temp;
		}

		private function __PaiHangTotal_zhanli_UIAsset25_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/word/jieshu.png";
			temp.x = 459;
			temp.y = 5;
			return temp;
		}

		private function btnLinQu_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnLinQu = temp;
			temp.name = "btnLinQu";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "领取奖励";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xEAEABC;
			temp.width = 88;
			temp.x = 417;
			temp.y = 493;
			return temp;
		}

		private function cellgroup_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			cellgroup = temp;
			temp.name = "cellgroup";
			temp.x = 0;
			temp.y = 60;
			temp.elementsContent = [];
			return temp;
		}

		private function icon1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon1 = temp;
			temp.name = "icon1";
			temp.styleName = "ui/common/grid/normal/36.png";
			temp.x = 137;
			temp.y = 493;
			return temp;
		}

		private function lbMiaosu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbMiaosu = temp;
			temp.name = "lbMiaosu";
			temp.htmlText = "在提升<font color='#00ff33'>400000</font>战力即可上榜，一览纵英雄风采！";
			temp.textAlign = "center";
			temp.color = 0xBBBDAA;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 408;
			temp.x = 72;
			temp.y = 215;
			return temp;
		}

		private function lbMsg_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbMsg = temp;
			temp.name = "lbMsg";
			temp.text = "段位奖励详情";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = true;
			temp.x = 417;
			temp.y = 456;
			return temp;
		}

		private function skinFlip_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinFlip = temp;
			temp.name = "skinFlip";
			var skin:StateSkin = new org.mokylin.skin.common.Flip2_Skin()
			temp.skin = skin
			temp.x = 195;
			temp.y = 398;
			return temp;
		}

		private function skinRight_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinRight = temp;
			temp.name = "skinRight";
			temp.height = 522;
			var skin:StateSkin = new org.mokylin.skin.app.paihangbang.PaiHang_Right()
			temp.skin = skin
			temp.width = 370;
			temp.x = 549;
			temp.y = 15;
			return temp;
		}

		private function uiLevelName_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiLevelName = temp;
			temp.name = "uiLevelName";
			temp.styleName = "ui/app/paihangbang/icon/name2/1001.png";
			temp.x = 124;
			temp.y = 471;
			return temp;
		}

		private function uiLevel_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiLevel = temp;
			temp.name = "uiLevel";
			temp.styleName = "ui/app/paihangbang/icon/1001_min.png";
			temp.x = 119;
			temp.y = 425;
			return temp;
		}

		private function uiTongjizhong_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiTongjizhong = temp;
			temp.name = "uiTongjizhong";
			temp.styleName = "ui/app/paihangbang/word/niweishangbang.png";
			temp.x = 124;
			temp.y = 165;
			return temp;
		}

	}
}