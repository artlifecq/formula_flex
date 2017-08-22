package org.mokylin.skin.app.activety.zonghe
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;
	import org.mokylin.skin.component.list.ListSkin1;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ActivetyAll_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var ListItem:feathers.controls.List;

		public var activeBg:feathers.controls.UIAsset;

		public var activeName:feathers.controls.UIAsset;

		public var grpIcon:feathers.controls.Group;

		public var icon1:feathers.controls.UIAsset;

		public var icon2:feathers.controls.UIAsset;

		public var icon3:feathers.controls.UIAsset;

		public var icon4:feathers.controls.UIAsset;

		public var joinBtn:feathers.controls.Button;

		public var lbMsg:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ActivetyAll_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 601;
			this.width = 956;
			this.elementsContent = [__ActivetyAll_Skin_UIAsset2_i(),ListItem_i(),activeBg_i(),__ActivetyAll_Skin_Group1_i(),__ActivetyAll_Skin_UIAsset4_i(),__ActivetyAll_Skin_UIAsset5_i(),__ActivetyAll_Skin_UIAsset6_i(),__ActivetyAll_Skin_UIAsset7_i(),__ActivetyAll_Skin_UIAsset8_i(),joinBtn_i(),lbMsg_i(),__ActivetyAll_Skin_UIAsset9_i(),grpIcon_i()];
			
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
			temp.height = 500;
			temp.styleClass = org.mokylin.skin.component.list.ListSkin1;
			temp.width = 531;
			temp.x = 25;
			temp.y = 88;
			return temp;
		}

		private function __ActivetyAll_Skin_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.height = 30;
			temp.width = 301;
			temp.x = 598;
			temp.y = 93;
			temp.elementsContent = [__ActivetyAll_Skin_UIAsset3_i(),activeName_i()];
			return temp;
		}

		private function __ActivetyAll_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 512;
			temp.styleName = "ui/common/background/neikuang_1.png";
			temp.width = 382;
			temp.x = 558;
			temp.y = 82;
			return temp;
		}

		private function __ActivetyAll_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/zonghe/xiaoheidi.png";
			temp.x = 31;
			temp.y = 0;
			return temp;
		}

		private function __ActivetyAll_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/titilebg/wenzikuang.png";
			temp.width = 370;
			temp.x = 564;
			temp.y = 285;
			return temp;
		}

		private function __ActivetyAll_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/titilebg/wenzikuang.png";
			temp.width = 370;
			temp.x = 564;
			temp.y = 392;
			return temp;
		}

		private function __ActivetyAll_Skin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/zonghe/hdjl.png";
			temp.x = 717;
			temp.y = 285;
			return temp;
		}

		private function __ActivetyAll_Skin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/zonghe/hdsm.png";
			temp.x = 717;
			temp.y = 393;
			return temp;
		}

		private function __ActivetyAll_Skin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/shijieboss/xiabg.png";
			temp.x = 564;
			temp.y = 418;
			return temp;
		}

		private function __ActivetyAll_Skin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/shijieboss/daojudi.png";
			temp.x = 568;
			temp.y = 313;
			return temp;
		}

		private function activeBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			activeBg = temp;
			temp.name = "activeBg";
			temp.styleName = "ui/big_bg/activety/des/tianjiangyuanbao.jpg";
			temp.x = 564;
			temp.y = 86;
			return temp;
		}

		private function activeName_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			activeName = temp;
			temp.name = "activeName";
			temp.styleName = "ui/app/activety/zonghe/active_name/dianfengduijue.png";
			temp.x = 104.5;
			temp.y = 0;
			return temp;
		}

		private function grpIcon_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpIcon = temp;
			temp.name = "grpIcon";
			temp.x = 599;
			temp.y = 326;
			temp.elementsContent = [icon1_i(),icon2_i(),icon3_i(),icon4_i()];
			return temp;
		}

		private function icon1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon1 = temp;
			temp.name = "icon1";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function icon2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon2 = temp;
			temp.name = "icon2";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 83;
			temp.y = 0;
			return temp;
		}

		private function icon3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon3 = temp;
			temp.name = "icon3";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 173;
			temp.y = 0;
			return temp;
		}

		private function icon4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon4 = temp;
			temp.name = "icon4";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 260;
			temp.y = 0;
			return temp;
		}

		private function joinBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			joinBtn = temp;
			temp.name = "joinBtn";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "参加活动";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xEAEABC;
			temp.width = 110;
			temp.x = 694;
			temp.y = 535;
			return temp;
		}

		private function lbMsg_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbMsg = temp;
			temp.name = "lbMsg";
			temp.height = 93;
			temp.htmlText = "1.每天前<font color='#00ff33'>100</font>场可获得<font color='#00ff33'>名望奖励</font><br>2.每周根据积分结算排名奖励";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.leading = 7;
			temp.letterSpacing = 0;
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 350;
			temp.x = 578;
			temp.y = 432;
			return temp;
		}

	}
}