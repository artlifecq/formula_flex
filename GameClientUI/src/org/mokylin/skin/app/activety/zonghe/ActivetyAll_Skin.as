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
	import feathers.layout.HorizontalLayout;
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

		public var icon1:feathers.controls.UIAsset;

		public var joinBtn:feathers.controls.Button;

		public var lbMsg:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ActivetyAll_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 587;
			this.width = 956;
			this.elementsContent = [__ActivetyAll_Skin_UIAsset2_i(),ListItem_i(),activeBg_i(),__ActivetyAll_Skin_Group1_i(),__ActivetyAll_Skin_UIAsset3_i(),__ActivetyAll_Skin_UIAsset4_i(),__ActivetyAll_Skin_UIAsset5_i(),__ActivetyAll_Skin_UIAsset6_i(),lbMsg_i(),joinBtn_i(),__ActivetyAll_Skin_UIAsset7_i(),icon1_i()];
			
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
			temp.height = 486;
			temp.styleClass = org.mokylin.skin.component.list.ListSkin1;
			temp.width = 602;
			temp.x = 25;
			temp.y = 88;
			return temp;
		}

		private function __ActivetyAll_Skin_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.height = 30;
			temp.width = 301;
			temp.x = 633;
			temp.y = 89;
			temp.layout = __ActivetyAll_Skin_HorizontalLayout1_i();
			temp.elementsContent = [activeName_i()];
			return temp;
		}

		private function __ActivetyAll_Skin_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.horizontalAlign = "center";
			temp.verticalAlign = "middle";
			return temp;
		}

		private function __ActivetyAll_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 498;
			temp.styleName = "ui/common/background/neikuang_1.png";
			temp.width = 313;
			temp.x = 627;
			temp.y = 82;
			return temp;
		}

		private function __ActivetyAll_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/zonghe/xzt.png";
			temp.x = 632;
			temp.y = 286;
			return temp;
		}

		private function __ActivetyAll_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/zonghe/xzt.png";
			temp.x = 632;
			temp.y = 393;
			return temp;
		}

		private function __ActivetyAll_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/zonghe/hdjl.png";
			temp.x = 744;
			temp.y = 286;
			return temp;
		}

		private function __ActivetyAll_Skin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/zonghe/hdsm.png";
			temp.x = 744;
			temp.y = 394;
			return temp;
		}

		private function __ActivetyAll_Skin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 76;
			temp.styleName = "ui/app/activety/zonghe/tubiaodi.png";
			temp.width = 298;
			temp.x = 631;
			temp.y = 304;
			return temp;
		}

		private function activeBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			activeBg = temp;
			temp.name = "activeBg";
			temp.styleName = "ui/big_bg/activety/des/1.jpg";
			temp.x = 633;
			temp.y = 88;
			return temp;
		}

		private function activeName_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			activeName = temp;
			temp.name = "activeName";
			temp.styleName = "ui/app/activety/zonghe/active_name/1.png";
			temp.x = 96;
			temp.y = 0;
			return temp;
		}

		private function icon1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon1 = temp;
			temp.name = "icon1";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 643;
			temp.y = 315;
			return temp;
		}

		private function joinBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			joinBtn = temp;
			temp.name = "joinBtn";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "参加活动";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xCFC6AE;
			temp.width = 112;
			temp.x = 733;
			temp.y = 520;
			return temp;
		}

		private function lbMsg_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbMsg = temp;
			temp.name = "lbMsg";
			temp.height = 93;
			temp.htmlText = "1.每天前<font color='#5DBD37'>100</font>场可获得<font color='#5DBD37'>名望奖励</font><br>2.每周根据积分结算排名奖励";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.leading = 7;
			temp.letterSpacing = 0;
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 297;
			temp.x = 631;
			temp.y = 426;
			return temp;
		}

	}
}