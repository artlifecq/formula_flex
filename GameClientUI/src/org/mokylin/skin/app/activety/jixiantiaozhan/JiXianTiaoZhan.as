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

		public var lbTime:feathers.controls.Label;

		public var skinFlip:feathers.controls.SkinnableContainer;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function JiXianTiaoZhan()
		{
			super();
			
			this.currentState = "normal";
			this.height = 587;
			this.width = 947;
			this.elementsContent = [__JiXianTiaoZhan_UIAsset1_i(),__JiXianTiaoZhan_UIAsset2_i(),__JiXianTiaoZhan_UIAsset3_i(),__JiXianTiaoZhan_UIAsset4_i(),__JiXianTiaoZhan_UIAsset5_i(),lbTime_i(),__JiXianTiaoZhan_Label1_i(),lbDec_i(),__JiXianTiaoZhan_UIAsset6_i(),lbBossKill_i(),__JiXianTiaoZhan_UIAsset7_i(),icon_i(),btn_enter_i(),__JiXianTiaoZhan_UIAsset8_i(),__JiXianTiaoZhan_UIAsset9_i(),__JiXianTiaoZhan_UIAsset10_i(),__JiXianTiaoZhan_UIAsset11_i(),__JiXianTiaoZhan_UIAsset12_i(),lbPaiMing_i(),lbShangHai_i(),__JiXianTiaoZhan_Group1_i(),skinFlip_i(),container_list_i()];
			
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
			temp.x = 628;
			temp.y = 104;
			temp.elementsContent = [__JiXianTiaoZhan_UIAsset13_i(),__JiXianTiaoZhan_UIAsset14_i(),__JiXianTiaoZhan_UIAsset15_i(),__JiXianTiaoZhan_UIAsset16_i()];
			return temp;
		}

		private function __JiXianTiaoZhan_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "活动规则:";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 77;
			temp.y = 148;
			return temp;
		}

		private function __JiXianTiaoZhan_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/jixiantiaozhan/bg1.png";
			temp.x = 629;
			temp.y = 470;
			return temp;
		}

		private function __JiXianTiaoZhan_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/jixiantiaozhan/wenzibg2.png";
			temp.x = 628;
			temp.y = 447;
			return temp;
		}

		private function __JiXianTiaoZhan_UIAsset12_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/jixiantiaozhan/wodepaihangjiangli2.png";
			temp.x = 724;
			temp.y = 448;
			return temp;
		}

		private function __JiXianTiaoZhan_UIAsset13_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/zonghe/zhanchangrizhibg.png";
			temp.width = 303;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __JiXianTiaoZhan_UIAsset14_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/zonghe/tianjianglijin/paiming.png";
			temp.x = 30;
			temp.y = 7;
			return temp;
		}

		private function __JiXianTiaoZhan_UIAsset15_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/zonghe/tianjianglijin/mingzi.png";
			temp.x = 122;
			temp.y = 7;
			return temp;
		}

		private function __JiXianTiaoZhan_UIAsset16_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/jixiantiaozhan/shanghai.png";
			temp.x = 237;
			temp.y = 7;
			return temp;
		}

		private function __JiXianTiaoZhan_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 498;
			temp.styleName = "ui/common/background/neikuang_1.png";
			temp.width = 922;
			temp.x = 14;
			temp.y = 72;
			return temp;
		}

		private function __JiXianTiaoZhan_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 498;
			temp.styleName = "ui/common/background/neikuang_1.png";
			temp.width = 614;
			temp.x = 14;
			temp.y = 72;
			return temp;
		}

		private function __JiXianTiaoZhan_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/activety/jixiantiaozhan_bg.jpg";
			temp.x = 20;
			temp.y = 77;
			return temp;
		}

		private function __JiXianTiaoZhan_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 25;
			temp.styleName = "ui/app/activety/jixiantiaozhan/paihangdi.png";
			temp.width = 236;
			temp.x = 36;
			temp.y = 100;
			return temp;
		}

		private function __JiXianTiaoZhan_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/jixiantiaozhan/huodongshuoming.png";
			temp.x = 46;
			temp.y = 103;
			return temp;
		}

		private function __JiXianTiaoZhan_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/jixiantiaozhan/shanglunBOSSjishazhe.png";
			temp.x = 71;
			temp.y = 460;
			return temp;
		}

		private function __JiXianTiaoZhan_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/jixiantiaozhan/zuihouyijijiangli1.png";
			temp.x = 71;
			temp.y = 508;
			return temp;
		}

		private function __JiXianTiaoZhan_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/zonghe/xzt.png";
			temp.x = 628;
			temp.y = 78;
			return temp;
		}

		private function __JiXianTiaoZhan_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/jixiantiaozhan/bossshanghaipaiming.png";
			temp.x = 734;
			temp.y = 78;
			return temp;
		}

		private function btn_enter_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_enter = temp;
			temp.name = "btn_enter";
			temp.styleClass = org.mokylin.skin.app.activety.jixiantiaozhan.button.ButtonJinruzhanchang;
			temp.x = 435;
			temp.y = 454;
			return temp;
		}

		private function container_list_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			container_list = temp;
			temp.name = "container_list";
			temp.height = 306;
			temp.width = 305;
			temp.x = 628;
			temp.y = 136;
			return temp;
		}

		private function icon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon = temp;
			temp.name = "icon";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 188;
			temp.y = 489;
			return temp;
		}

		private function lbBossKill_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbBossKill = temp;
			temp.name = "lbBossKill";
			temp.text = "暂 无";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 181;
			temp.x = 194;
			temp.y = 462;
			return temp;
		}

		private function lbDec_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbDec = temp;
			temp.name = "lbDec";
			temp.height = 159;
			temp.text = "活动规则:";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 492;
			temp.x = 77;
			temp.y = 193;
			return temp;
		}

		private function lbPaiMing_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbPaiMing = temp;
			temp.name = "lbPaiMing";
			temp.text = "我的排名：$";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 135;
			temp.x = 648;
			temp.y = 489;
			return temp;
		}

		private function lbShangHai_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbShangHai = temp;
			temp.name = "lbShangHai";
			temp.text = "我的伤害：$";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 135;
			temp.x = 798;
			temp.y = 489;
			return temp;
		}

		private function lbTime_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTime = temp;
			temp.name = "lbTime";
			temp.text = "每日19:20-19:40";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 149;
			temp.x = 120;
			temp.y = 104;
			return temp;
		}

		private function skinFlip_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinFlip = temp;
			temp.name = "skinFlip";
			var skin:StateSkin = new org.mokylin.skin.common.Flip1_Skin()
			temp.skin = skin
			temp.width = 106;
			temp.x = 722;
			temp.y = 521;
			return temp;
		}

	}
}