package org.mokylin.skin.app.activety.shijieboss
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_shouhui;
	import org.mokylin.skin.component.button.ButtonSkin_zhankai;
	import org.mokylin.skin.component.list.ListSkin1;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ShangHaiPaiHang extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var ListItem:feathers.controls.List;

		public var btn_close:feathers.controls.Button;

		public var btn_open:feathers.controls.Button;

		public var contentBox:feathers.controls.Group;

		public var gKiller:feathers.controls.Group;

		public var gNotKill:feathers.controls.Group;

		public var labKiller:feathers.controls.Label;

		public var myCon:feathers.controls.UIAsset;

		public var myLast:feathers.controls.Label;

		public var myMsg:feathers.controls.Label;

		public var myMsg0:feathers.controls.Label;

		public var uiIcon:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ShangHaiPaiHang()
		{
			super();
			
			this.currentState = "normal";
			this.height = 407;
			this.width = 302;
			this.elementsContent = [contentBox_i(),btn_close_i(),btn_open_i()];
			
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
			temp.height = 267;
			temp.styleClass = org.mokylin.skin.component.list.ListSkin1;
			temp.visible = false;
			temp.width = 295;
			temp.x = 6;
			temp.y = 60;
			return temp;
		}

		private function __ShangHaiPaiHang_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = -23;
			temp.y = 32;
			temp.elementsContent = [__ShangHaiPaiHang_UIAsset5_i(),__ShangHaiPaiHang_UIAsset6_i(),__ShangHaiPaiHang_UIAsset7_i(),__ShangHaiPaiHang_UIAsset8_i(),__ShangHaiPaiHang_Label1_i(),__ShangHaiPaiHang_Label2_i(),__ShangHaiPaiHang_Label3_i(),__ShangHaiPaiHang_Label4_i()];
			return temp;
		}

		private function __ShangHaiPaiHang_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "名次";
			temp.textAlign = "left";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 35;
			temp.x = 28;
			temp.y = 4;
			return temp;
		}

		private function __ShangHaiPaiHang_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "玩家名";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 104;
			temp.x = 82;
			temp.y = 4;
			return temp;
		}

		private function __ShangHaiPaiHang_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "伤害值";
			temp.textAlign = "left";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 56;
			temp.x = 223;
			temp.y = 4;
			return temp;
		}

		private function __ShangHaiPaiHang_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "奖励";
			temp.textAlign = "left";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 32;
			temp.x = 290;
			temp.y = 4;
			return temp;
		}

		private function __ShangHaiPaiHang_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 410;
			temp.styleName = "ui/common/background/neikuang_3.png";
			temp.width = 304;
			temp.x = 2;
			temp.y = 0;
			return temp;
		}

		private function __ShangHaiPaiHang_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/shijieboss/titledi.png";
			temp.x = 2;
			temp.y = 1;
			return temp;
		}

		private function __ShangHaiPaiHang_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/shijieboss/bosspaihang.png";
			temp.x = 39;
			temp.y = 5;
			return temp;
		}

		private function __ShangHaiPaiHang_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/shijieboss/zuihoulyijiwanjia.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __ShangHaiPaiHang_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 36;
			temp.x = 26;
			temp.y = 0;
			return temp;
		}

		private function __ShangHaiPaiHang_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 148;
			temp.x = 62;
			temp.y = 0;
			return temp;
		}

		private function __ShangHaiPaiHang_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 76;
			temp.x = 210;
			temp.y = 0;
			return temp;
		}

		private function __ShangHaiPaiHang_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 41;
			temp.x = 286;
			temp.y = 0;
			return temp;
		}

		private function btn_close_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_close = temp;
			temp.name = "btn_close";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_zhankai;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btn_open_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_open = temp;
			temp.name = "btn_open";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_shouhui;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function contentBox_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			contentBox = temp;
			temp.name = "contentBox";
			temp.height = 408;
			temp.width = 305;
			temp.x = -3;
			temp.y = 0;
			temp.elementsContent = [__ShangHaiPaiHang_UIAsset1_i(),myCon_i(),__ShangHaiPaiHang_UIAsset2_i(),__ShangHaiPaiHang_UIAsset3_i(),gNotKill_i(),__ShangHaiPaiHang_Group1_i(),ListItem_i(),uiIcon_i(),gKiller_i()];
			return temp;
		}

		private function gKiller_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			gKiller = temp;
			temp.name = "gKiller";
			temp.x = 21;
			temp.y = 368;
			temp.elementsContent = [myLast_i(),myMsg0_i(),labKiller_i()];
			return temp;
		}

		private function gNotKill_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			gNotKill = temp;
			temp.name = "gNotKill";
			temp.visible = false;
			temp.x = 21;
			temp.y = 366;
			temp.elementsContent = [__ShangHaiPaiHang_UIAsset4_i(),myMsg_i()];
			return temp;
		}

		private function labKiller_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labKiller = temp;
			temp.name = "labKiller";
			temp.height = 18;
			temp.text = "234";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 111;
			temp.x = 94;
			temp.y = 0;
			return temp;
		}

		private function myCon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			myCon = temp;
			temp.name = "myCon";
			temp.styleName = "ui/app/activety/shijieboss/bossbg.jpg";
			temp.width = 300;
			temp.x = 4;
			temp.y = 331;
			return temp;
		}

		private function myLast_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			myLast = temp;
			temp.name = "myLast";
			temp.text = "最后一击玩家：";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 228;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function myMsg0_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			myMsg0 = temp;
			temp.name = "myMsg0";
			temp.height = 17;
			temp.text = "已击杀BOSS,可根据排名获取排名奖励";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 275;
			temp.x = 0;
			temp.y = 18;
			return temp;
		}

		private function myMsg_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			myMsg = temp;
			temp.name = "myMsg";
			temp.height = 17;
			temp.text = "活动结束BOSS存活，所有人只能获得参与奖";
			temp.color = 0xFF0D0D;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 275;
			temp.x = 0;
			temp.y = 19;
			return temp;
		}

		private function uiIcon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiIcon = temp;
			temp.name = "uiIcon";
			temp.styleName = "ui/app/activety/shijieboss/icon/1.png";
			temp.x = 261;
			temp.y = 363;
			return temp;
		}

	}
}