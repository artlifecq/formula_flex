package org.mokylin.skin.app.paihangbang
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.paihangbang.PaiHang_Right;
	import org.mokylin.skin.common.Flip2_Skin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class PaiHangTotal_dianfeng extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var cellgroup:feathers.controls.Group;

		public var lbMiaosu:feathers.controls.Label;

		public var skinFlip:feathers.controls.SkinnableContainer;

		public var skinRight:feathers.controls.SkinnableContainer;

		public var uiTongjizhong:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function PaiHangTotal_dianfeng()
		{
			super();
			
			this.currentState = "normal";
			this.height = 537;
			this.width = 917;
			this.elementsContent = [cellgroup_i(),skinFlip_i(),__PaiHangTotal_dianfeng_Group1_i(),__PaiHangTotal_dianfeng_Group2_i(),uiTongjizhong_i(),lbMiaosu_i(),skinRight_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __PaiHangTotal_dianfeng_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 0;
			temp.y = 432;
			temp.elementsContent = [__PaiHangTotal_dianfeng_UIAsset14_i(),__PaiHangTotal_dianfeng_UIAsset15_i()];
			return temp;
		}

		private function __PaiHangTotal_dianfeng_Group2_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 0;
			temp.y = 33;
			temp.elementsContent = [__PaiHangTotal_dianfeng_UIAsset16_i(),__PaiHangTotal_dianfeng_UIAsset17_i(),__PaiHangTotal_dianfeng_UIAsset18_i(),__PaiHangTotal_dianfeng_UIAsset19_i(),__PaiHangTotal_dianfeng_UIAsset20_i(),__PaiHangTotal_dianfeng_UIAsset21_i(),__PaiHangTotal_dianfeng_UIAsset22_i(),__PaiHangTotal_dianfeng_UIAsset23_i(),__PaiHangTotal_dianfeng_UIAsset24_i(),__PaiHangTotal_dianfeng_UIAsset25_i()];
			return temp;
		}

		private function __PaiHangTotal_dianfeng_UIAsset14_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/titilebg/wenzikuang.png";
			temp.width = 546;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __PaiHangTotal_dianfeng_UIAsset15_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/word/wodepaiming.png";
			temp.x = 245;
			temp.y = 4;
			return temp;
		}

		private function __PaiHangTotal_dianfeng_UIAsset16_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 75;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __PaiHangTotal_dianfeng_UIAsset17_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 185;
			temp.x = 75;
			temp.y = 0;
			return temp;
		}

		private function __PaiHangTotal_dianfeng_UIAsset18_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 72;
			temp.x = 260;
			temp.y = 0;
			return temp;
		}

		private function __PaiHangTotal_dianfeng_UIAsset19_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 74;
			temp.x = 332;
			temp.y = 0;
			return temp;
		}

		private function __PaiHangTotal_dianfeng_UIAsset20_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 140;
			temp.x = 406;
			temp.y = 0;
			return temp;
		}

		private function __PaiHangTotal_dianfeng_UIAsset21_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/word/paiming.png";
			temp.x = 25;
			temp.y = 5;
			return temp;
		}

		private function __PaiHangTotal_dianfeng_UIAsset22_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/word/xingming.png";
			temp.x = 148;
			temp.y = 5;
			return temp;
		}

		private function __PaiHangTotal_dianfeng_UIAsset23_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/word/dengji.png";
			temp.x = 279;
			temp.y = 5;
			return temp;
		}

		private function __PaiHangTotal_dianfeng_UIAsset24_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/word/zhiye.png";
			temp.x = 352;
			temp.y = 5;
			return temp;
		}

		private function __PaiHangTotal_dianfeng_UIAsset25_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/word/zhanli.png";
			temp.x = 459;
			temp.y = 5;
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

		private function skinFlip_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinFlip = temp;
			temp.name = "skinFlip";
			var skin:StateSkin = new org.mokylin.skin.common.Flip2_Skin()
			temp.skin = skin
			temp.x = 195;
			temp.y = 492;
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