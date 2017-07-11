package org.mokylin.skin.app.hongbao
{
	import feathers.controls.text.Fontter;
	import feathers.data.ListCollection;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.TabBar;
	import feathers.controls.UIAsset;
	import feathers.layout.HorizontalLayout;
	import org.mokylin.skin.app.hongbao.HongBao_Fa;
	import org.mokylin.skin.common.TongYongPanelbg1;
	import org.mokylin.skin.component.button.ButtonSkin_info;
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
		public var bg:feathers.controls.SkinnableContainer;

		public var btnInfo:feathers.controls.Button;

		public var fbg2:feathers.controls.UIAsset;

		public var grpNum:feathers.controls.Group;

		public var lbNum:feathers.controls.Label;

		public var lbTotal:feathers.controls.Label;

		public var skinFa:feathers.controls.SkinnableContainer;

		public var tabBar:feathers.controls.TabBar;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function HongBao_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 601;
			this.width = 956;
			this.elementsContent = [bg_i(),__HongBao_Skin_UIAsset1_i(),__HongBao_Skin_UIAsset2_i(),__HongBao_Skin_UIAsset3_i(),tabBar_i(),skinFa_i(),__HongBao_Skin_UIAsset4_i(),grpNum_i(),btnInfo_i(),__HongBao_Skin_UIAsset5_i(),__HongBao_Skin_Label1_i(),lbTotal_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __HongBao_Skin_ArrayCollection1_i():feathers.data.ListCollection
		{
			var temp:feathers.data.ListCollection = new feathers.data.ListCollection();
			temp.data = ['红包列表','领取记录'];
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
			temp.styleName = "ui/app/hongbao/jinrilingqu.png";
			temp.x = 691;
			temp.y = 92;
			return temp;
		}

		private function __HongBao_Skin_UIAsset5_i():feathers.controls.UIAsset
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

		private function skinFa_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinFa = temp;
			temp.name = "skinFa";
			temp.height = 502;
			var skin:StateSkin = new org.mokylin.skin.app.hongbao.HongBao_Fa()
			temp.skin = skin
			temp.width = 271;
			temp.x = 23;
			temp.y = 87;
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

	}
}