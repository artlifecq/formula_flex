package org.mokylin.skin.app.activety.jixiantiaozhan
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.common.TongYongTanKuang_bg2;
	import org.mokylin.skin.component.button.ButtonSkin_close;
	import org.mokylin.skin.component.list.ListSkin1;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class JiXianTiaoZhanPaiHang extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.SkinnableContainer;

		public var btnClose:feathers.controls.Button;

		public var grpIcon:feathers.controls.Group;

		public var icon1:feathers.controls.UIAsset;

		public var icon2:feathers.controls.UIAsset;

		public var icon3:feathers.controls.UIAsset;

		public var icon4:feathers.controls.UIAsset;

		public var lbPaiming:feathers.controls.Label;

		public var listItem:feathers.controls.List;

		public var uiJiangli:feathers.controls.UIAsset;

		public var uiWRB:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function JiXianTiaoZhanPaiHang()
		{
			super();
			
			this.currentState = "normal";
			this.height = 557;
			this.width = 321;
			this.elementsContent = [bg_i(),listItem_i(),__JiXianTiaoZhanPaiHang_UIAsset1_i(),uiWRB_i(),grpIcon_i(),__JiXianTiaoZhanPaiHang_UIAsset2_i(),uiJiangli_i(),lbPaiming_i(),__JiXianTiaoZhanPaiHang_Label1_i(),__JiXianTiaoZhanPaiHang_UIAsset3_i(),btnClose_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __JiXianTiaoZhanPaiHang_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "伤害总排行奖励将于BOSS击杀且活动结束后发放";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 301;
			temp.x = 11;
			temp.y = 531;
			return temp;
		}

		private function __JiXianTiaoZhanPaiHang_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/jixiantiaozhan/bg2.png";
			temp.x = 6;
			temp.y = 445;
			return temp;
		}

		private function __JiXianTiaoZhanPaiHang_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/jixiantiaozhan/wodepaiming.png";
			temp.x = 15;
			temp.y = 456;
			return temp;
		}

		private function __JiXianTiaoZhanPaiHang_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/app/activety/jixiantiaozhan/zongshanghai.png";
			temp.x = 84;
			temp.y = 8;
			return temp;
		}

		private function bg_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			bg = temp;
			temp.name = "bg";
			temp.height = 557;
			var skin:StateSkin = new org.mokylin.skin.common.TongYongTanKuang_bg2()
			temp.skin = skin
			temp.width = 321;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_close;
			temp.x = 288;
			temp.y = 6;
			return temp;
		}

		private function grpIcon_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpIcon = temp;
			temp.name = "grpIcon";
			temp.x = 94;
			temp.y = 480;
			temp.elementsContent = [icon1_i(),icon2_i(),icon3_i(),icon4_i()];
			return temp;
		}

		private function icon1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon1 = temp;
			temp.name = "icon1";
			temp.styleName = "ui/common/grid/normal/42.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function icon2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon2 = temp;
			temp.name = "icon2";
			temp.styleName = "ui/common/grid/normal/42.png";
			temp.x = 51;
			temp.y = 0;
			return temp;
		}

		private function icon3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon3 = temp;
			temp.name = "icon3";
			temp.styleName = "ui/common/grid/normal/42.png";
			temp.x = 105;
			temp.y = 0;
			return temp;
		}

		private function icon4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon4 = temp;
			temp.name = "icon4";
			temp.styleName = "ui/common/grid/normal/42.png";
			temp.x = 158;
			temp.y = 0;
			return temp;
		}

		private function lbPaiming_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbPaiming = temp;
			temp.name = "lbPaiming";
			temp.text = "622222";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 75;
			temp.x = 103;
			temp.y = 456;
			return temp;
		}

		private function listItem_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			listItem = temp;
			temp.name = "listItem";
			temp.height = 410;
			temp.styleClass = org.mokylin.skin.component.list.ListSkin1;
			temp.width = 304;
			temp.x = 9;
			temp.y = 35;
			return temp;
		}

		private function uiJiangli_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiJiangli = temp;
			temp.name = "uiJiangli";
			temp.styleName = "ui/app/activety/jixiantiaozhan/wodejiangli.png";
			temp.x = 14;
			temp.y = 493;
			return temp;
		}

		private function uiWRB_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiWRB = temp;
			temp.name = "uiWRB";
			temp.styleName = "ui/app/activety/jixiantiaozhan/shangweirubangzaijiezaili.png";
			temp.x = 83;
			temp.y = 490;
			return temp;
		}

	}
}