package org.mokylin.skin.app.activety.jixiantiaozhan
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.activety.jixiantiaozhan.button.ButtonJinruzhanchang;
	import org.mokylin.skin.common.Flip1_Skin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class JiXianTiaoZhan extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn_enter:feathers.controls.Button;

		public var container_list:feathers.controls.SkinnableContainer;

		public var icon:feathers.controls.UIAsset;

		public var lbBossKill:feathers.controls.Label;

		public var lbDec:feathers.controls.Label;

		public var lbPaiMing:feathers.controls.Label;

		public var lbShangHai:feathers.controls.Label;

		public var skinFlip:feathers.controls.SkinnableContainer;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function JiXianTiaoZhan()
		{
			super();
			
			this.currentState = "normal";
			this.height = 601;
			this.width = 956;
			this.elementsContent = [__JiXianTiaoZhan_UIAsset3_i(),__JiXianTiaoZhan_UIAsset4_i(),__JiXianTiaoZhan_UIAsset5_i(),__JiXianTiaoZhan_UIAsset6_i(),__JiXianTiaoZhan_UIAsset7_i(),__JiXianTiaoZhan_Label1_i(),lbDec_i(),__JiXianTiaoZhan_UIAsset8_i(),lbBossKill_i(),__JiXianTiaoZhan_UIAsset9_i(),icon_i(),btn_enter_i(),__JiXianTiaoZhan_UIAsset10_i(),__JiXianTiaoZhan_UIAsset11_i(),__JiXianTiaoZhan_UIAsset12_i(),__JiXianTiaoZhan_UIAsset13_i(),__JiXianTiaoZhan_UIAsset14_i(),__JiXianTiaoZhan_UIAsset15_i(),__JiXianTiaoZhan_UIAsset16_i(),lbPaiMing_i(),lbShangHai_i(),__JiXianTiaoZhan_Group1_i(),container_list_i(),skinFlip_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __JiXianTiaoZhan_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 632;
			temp.y = 114;
			temp.elementsContent = [__JiXianTiaoZhan_UIAsset17_i(),__JiXianTiaoZhan_UIAsset18_i(),__JiXianTiaoZhan_UIAsset19_i(),__JiXianTiaoZhan_UIAsset20_i()];
			return temp;
		}

		private function __JiXianTiaoZhan_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "活动规则:";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 36;
			temp.y = 488;
			return temp;
		}

		private function __JiXianTiaoZhan_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/titilebg/wenzikuang.png";
			temp.width = 303;
			temp.x = 632;
			temp.y = 88;
			return temp;
		}

		private function __JiXianTiaoZhan_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/jixiantiaozhan/bossshanghaipaiming.png";
			temp.x = 738;
			temp.y = 88;
			return temp;
		}

		private function __JiXianTiaoZhan_UIAsset12_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/jixiantiaozhan/bg1.png";
			temp.x = 633;
			temp.y = 523;
			return temp;
		}

		private function __JiXianTiaoZhan_UIAsset13_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/titilebg/wenzikuang.png";
			temp.width = 303;
			temp.x = 632;
			temp.y = 500;
			return temp;
		}

		private function __JiXianTiaoZhan_UIAsset14_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/jixiantiaozhan/wodepaihangjiangli2.png";
			temp.x = 728;
			temp.y = 501;
			return temp;
		}

		private function __JiXianTiaoZhan_UIAsset15_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/jixiantiaozhan/wodepaiming.png";
			temp.x = 643;
			temp.y = 547;
			return temp;
		}

		private function __JiXianTiaoZhan_UIAsset16_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/jixiantiaozhan/wodeshanghailiang.png";
			temp.x = 785;
			temp.y = 547;
			return temp;
		}

		private function __JiXianTiaoZhan_UIAsset17_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/titilebg/headbg1.png";
			temp.width = 303;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __JiXianTiaoZhan_UIAsset18_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/zonghe/tianjianglijin/paiming.png";
			temp.x = 29;
			temp.y = 7;
			return temp;
		}

		private function __JiXianTiaoZhan_UIAsset19_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/zonghe/tianjianglijin/mingzi.png";
			temp.x = 122;
			temp.y = 7;
			return temp;
		}

		private function __JiXianTiaoZhan_UIAsset20_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/jixiantiaozhan/shanghai.png";
			temp.x = 237;
			temp.y = 7;
			return temp;
		}

		private function __JiXianTiaoZhan_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 512;
			temp.styleName = "ui/common/background/neikuang_1.png";
			temp.width = 614;
			temp.x = 18;
			temp.y = 82;
			return temp;
		}

		private function __JiXianTiaoZhan_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/activety/jixiantiaozhan_bg.jpg";
			temp.x = 23;
			temp.y = 87;
			return temp;
		}

		private function __JiXianTiaoZhan_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 137;
			temp.styleName = "ui/app/activety/jixiantiaozhan/jiugong.png";
			temp.width = 450;
			temp.x = 23;
			temp.y = 454;
			return temp;
		}

		private function __JiXianTiaoZhan_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 25;
			temp.styleName = "ui/app/activety/jixiantiaozhan/paihangdi.png";
			temp.width = 236;
			temp.x = 44;
			temp.y = 459;
			return temp;
		}

		private function __JiXianTiaoZhan_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/jixiantiaozhan/huodongshuoming.png";
			temp.x = 68;
			temp.y = 462;
			return temp;
		}

		private function __JiXianTiaoZhan_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/jixiantiaozhan/shanglunBOSSjishazhe.png";
			temp.x = 37;
			temp.y = 370;
			return temp;
		}

		private function __JiXianTiaoZhan_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/jixiantiaozhan/zuihouyijijiangli1.png";
			temp.x = 39;
			temp.y = 415;
			return temp;
		}

		private function btn_enter_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_enter = temp;
			temp.name = "btn_enter";
			temp.styleClass = org.mokylin.skin.app.activety.jixiantiaozhan.button.ButtonJinruzhanchang;
			temp.x = 481;
			temp.y = 480;
			return temp;
		}

		private function container_list_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			container_list = temp;
			temp.name = "container_list";
			temp.height = 332;
			temp.width = 303;
			temp.x = 632;
			temp.y = 143;
			return temp;
		}

		private function icon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon = temp;
			temp.name = "icon";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 156;
			temp.y = 395;
			return temp;
		}

		private function lbBossKill_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbBossKill = temp;
			temp.name = "lbBossKill";
			temp.text = "暂 无";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = true;
			temp.width = 181;
			temp.x = 161;
			temp.y = 372;
			return temp;
		}

		private function lbDec_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbDec = temp;
			temp.name = "lbDec";
			temp.height = 83;
			temp.text = "活动规则:";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 492;
			temp.x = 36;
			temp.y = 507;
			return temp;
		}

		private function lbPaiMing_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbPaiMing = temp;
			temp.name = "lbPaiMing";
			temp.text = "未上榜";
			temp.color = 0xFF0D0D;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 77;
			temp.x = 720;
			temp.y = 547;
			return temp;
		}

		private function lbShangHai_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbShangHai = temp;
			temp.name = "lbShangHai";
			temp.text = "暂无";
			temp.color = 0xFF0D0D;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 64;
			temp.x = 876;
			temp.y = 547;
			return temp;
		}

		private function skinFlip_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinFlip = temp;
			temp.name = "skinFlip";
			var skin:StateSkin = new org.mokylin.skin.common.Flip1_Skin()
			temp.skin = skin
			temp.width = 116;
			temp.x = 721;
			temp.y = 473;
			return temp;
		}

	}
}