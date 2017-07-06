package org.mokylin.skin.app.hongbao
{
	import feathers.controls.text.Fontter;
	import feathers.data.ListCollection;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.TabBar;
	import feathers.controls.UIAsset;
	import feathers.layout.HorizontalLayout;
	import org.mokylin.skin.app.hongbao.button.ButtonFahongbao;
	import org.mokylin.skin.common.TongYongPanelbg1;
	import org.mokylin.skin.component.button.ButtonSkin_info;
	import org.mokylin.skin.component.button.ButtonSkin_jia;
	import org.mokylin.skin.component.button.ButtonSkin_jian;
	import org.mokylin.skin.component.button.ButtonSkin_putongMax;
	import org.mokylin.skin.component.list.ListSkin1;
	import org.mokylin.skin.component.tabbar.TabBarSkin_pack;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class HongBao_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var ListItem:feathers.controls.List;

		public var bg:feathers.controls.SkinnableContainer;

		public var btnFa:feathers.controls.Button;

		public var btnInfo:feathers.controls.Button;

		public var btn_all:feathers.controls.Button;

		public var btn_max:feathers.controls.Button;

		public var btn_min:feathers.controls.Button;

		public var faBg:feathers.controls.UIAsset;

		public var fbg:feathers.controls.UIAsset;

		public var fbg2:feathers.controls.UIAsset;

		public var grpFa:feathers.controls.Group;

		public var grpFlip:feathers.controls.Group;

		public var grpNum:feathers.controls.Group;

		public var lbBuyNum:feathers.controls.Label;

		public var lbItem:feathers.controls.Label;

		public var lbNum:feathers.controls.Label;

		public var lbTotal:feathers.controls.Label;

		public var tabBar:feathers.controls.TabBar;

		public var uiDown:feathers.controls.UIAsset;

		public var uiIcon:feathers.controls.UIAsset;

		public var uiUp:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function HongBao_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 601;
			this.width = 956;
			this.elementsContent = [bg_i(),__HongBao_Skin_UIAsset1_i(),__HongBao_Skin_UIAsset2_i(),__HongBao_Skin_UIAsset3_i(),__HongBao_Skin_UIAsset4_i(),uiDown_i(),uiUp_i(),uiIcon_i(),btnFa_i(),grpFa_i(),grpFlip_i(),tabBar_i(),__HongBao_Skin_UIAsset5_i(),grpNum_i(),btnInfo_i(),__HongBao_Skin_Group1_i(),ListItem_i(),__HongBao_Skin_UIAsset9_i(),__HongBao_Skin_Label4_i(),lbTotal_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function ListItem_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			ListItem = temp;
			temp.name = "ListItem";
			temp.height = 401;
			temp.styleClass = org.mokylin.skin.component.list.ListSkin1;
			temp.width = 636;
			temp.x = 297;
			temp.y = 146;
			return temp;
		}

		private function __HongBao_Skin_ArrayCollection1_i():feathers.data.ListCollection
		{
			var temp:feathers.data.ListCollection = new feathers.data.ListCollection();
			temp.data = ['红包列表','领取记录'];
			return temp;
		}

		private function __HongBao_Skin_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 297;
			temp.y = 120;
			temp.elementsContent = [__HongBao_Skin_UIAsset6_i(),__HongBao_Skin_UIAsset7_i(),__HongBao_Skin_UIAsset8_i(),__HongBao_Skin_Label1_i(),__HongBao_Skin_Label2_i(),__HongBao_Skin_Label3_i()];
			return temp;
		}

		private function __HongBao_Skin_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.gap = 0;
			return temp;
		}

		private function __HongBao_Skin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "土豪";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 98;
			temp.y = 4;
			return temp;
		}

		private function __HongBao_Skin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "红包类型";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 287;
			temp.y = 4;
			return temp;
		}

		private function __HongBao_Skin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "红包操作";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 483;
			temp.y = 4;
			return temp;
		}

		private function __HongBao_Skin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "本月累积收到红包金额：";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 707;
			temp.y = 560;
			return temp;
		}

		private function __HongBao_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 512;
			temp.styleName = "ui/common/background/neikuang_1.png";
			temp.width = 922;
			temp.x = 18;
			temp.y = 82;
			return temp;
		}

		private function __HongBao_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 473;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.width = 642;
			temp.x = 294;
			temp.y = 117;
			return temp;
		}

		private function __HongBao_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/app/hongbao/wodehongbao.png";
			temp.x = 435;
			temp.y = 17;
			return temp;
		}

		private function __HongBao_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/hongbao/bg.jpg";
			temp.x = 23;
			temp.y = 87;
			return temp;
		}

		private function __HongBao_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/hongbao/jinrilingqu.png";
			temp.x = 691;
			temp.y = 92;
			return temp;
		}

		private function __HongBao_Skin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 227;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __HongBao_Skin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 179;
			temp.x = 227;
			temp.y = 0;
			return temp;
		}

		private function __HongBao_Skin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 230;
			temp.x = 406;
			temp.y = 0;
			return temp;
		}

		private function __HongBao_Skin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/hongbao/xiaban.jpg";
			temp.x = 297;
			temp.y = 549;
			return temp;
		}

		private function bg_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			bg = temp;
			temp.name = "bg";
			temp.height = 601;
			var skin:StateSkin = new org.mokylin.skin.common.TongYongPanelbg1()
			temp.skin = skin
			temp.width = 956;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnFa_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnFa = temp;
			temp.name = "btnFa";
			temp.styleClass = org.mokylin.skin.app.hongbao.button.ButtonFahongbao;
			temp.x = 103;
			temp.y = 318;
			return temp;
		}

		private function btnInfo_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnInfo = temp;
			temp.name = "btnInfo";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_info;
			temp.x = 882;
			temp.y = 91;
			return temp;
		}

		private function btn_all_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_all = temp;
			temp.name = "btn_all";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putongMax;
			temp.x = 104;
			temp.y = 0;
			return temp;
		}

		private function btn_max_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_max = temp;
			temp.name = "btn_max";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jia;
			temp.x = 81;
			temp.y = 0;
			return temp;
		}

		private function btn_min_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_min = temp;
			temp.name = "btn_min";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jian;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function faBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			faBg = temp;
			temp.name = "faBg";
			temp.height = 49;
			temp.styleName = "ui/app/hongbao/dibanhuitiao.png";
			temp.width = 235;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function fbg2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			fbg2 = temp;
			temp.name = "fbg2";
			temp.styleName = "ui/component/text/flip_bg.png";
			temp.width = 76;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function fbg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			fbg = temp;
			temp.name = "fbg";
			temp.styleName = "ui/component/text/flip_bg.png";
			temp.width = 57;
			temp.x = 23;
			temp.y = 0;
			return temp;
		}

		private function grpFa_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpFa = temp;
			temp.name = "grpFa";
			temp.x = 41;
			temp.y = 266;
			temp.elementsContent = [faBg_i(),lbItem_i()];
			return temp;
		}

		private function grpFlip_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpFlip = temp;
			temp.name = "grpFlip";
			temp.x = 82;
			temp.y = 488;
			temp.elementsContent = [btn_min_i(),btn_max_i(),btn_all_i(),fbg_i(),lbBuyNum_i()];
			return temp;
		}

		private function grpNum_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpNum = temp;
			temp.name = "grpNum";
			temp.x = 804;
			temp.y = 92;
			temp.elementsContent = [fbg2_i(),lbNum_i()];
			return temp;
		}

		private function lbBuyNum_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbBuyNum = temp;
			temp.name = "lbBuyNum";
			temp.text = "1000";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 53;
			temp.x = 23;
			temp.y = 2;
			return temp;
		}

		private function lbItem_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbItem = temp;
			temp.name = "lbItem";
			temp.height = 45;
			temp.htmlText = "当前可派发红包次数：<font color='#00ff33'>1</font><br>累计充值<font color='#00ff33'>200</font>元宝，可派发一个红包";
			temp.leading = 10;
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 231;
			temp.x = 2;
			temp.y = 2;
			return temp;
		}

		private function lbNum_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbNum = temp;
			temp.name = "lbNum";
			temp.text = "1000";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 74;
			temp.x = 0;
			temp.y = 2;
			return temp;
		}

		private function lbTotal_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTotal = temp;
			temp.name = "lbTotal";
			temp.text = "202";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 69;
			temp.x = 861;
			temp.y = 560;
			return temp;
		}

		private function tabBar_i():feathers.controls.TabBar
		{
			var temp:feathers.controls.TabBar = new feathers.controls.TabBar();
			tabBar = temp;
			temp.name = "tabBar";
			temp.btnWidth = 78;
			temp.styleClass = org.mokylin.skin.component.tabbar.TabBarSkin_pack;
			temp.width = 331;
			temp.x = 304;
			temp.y = 89;
			temp.layout = __HongBao_Skin_HorizontalLayout1_i();
			temp.dataProvider = __HongBao_Skin_ArrayCollection1_i();
			return temp;
		}

		private function uiDown_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiDown = temp;
			temp.name = "uiDown";
			temp.styleName = "ui/app/hongbao/xia.png";
			temp.x = 25;
			temp.y = 314;
			return temp;
		}

		private function uiIcon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiIcon = temp;
			temp.name = "uiIcon";
			temp.styleName = "ui/app/hongbao/jubaopen.png";
			temp.x = 61;
			temp.y = 117;
			return temp;
		}

		private function uiUp_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiUp = temp;
			temp.name = "uiUp";
			temp.styleName = "ui/app/hongbao/shang.png";
			temp.x = 25;
			temp.y = 89;
			return temp;
		}

	}
}