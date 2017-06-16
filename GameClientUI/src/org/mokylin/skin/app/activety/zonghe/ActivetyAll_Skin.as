package org.mokylin.skin.app.activety.zonghe
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
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
			this.height = 587;
			this.width = 947;
			this.elementsContent = [__ActivetyAll_Skin_UIAsset1_i(),__ActivetyAll_Skin_UIAsset2_i(),ListItem_i(),activeBg_i(),activeName_i(),__ActivetyAll_Skin_UIAsset3_i(),__ActivetyAll_Skin_UIAsset4_i(),__ActivetyAll_Skin_UIAsset5_i(),__ActivetyAll_Skin_UIAsset6_i(),lbMsg_i(),joinBtn_i(),__ActivetyAll_Skin_UIAsset7_i(),icon1_i(),icon2_i(),icon3_i(),icon4_i()];
			
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
			temp.x = 21;
			temp.y = 78;
			return temp;
		}

		private function __ActivetyAll_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 498;
			temp.styleName = "ui/common/background/neikuang_1.png";
			temp.width = 922;
			temp.x = 14;
			temp.y = 72;
			return temp;
		}

		private function __ActivetyAll_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 498;
			temp.styleName = "ui/common/background/neikuang_1.png";
			temp.width = 313;
			temp.x = 623;
			temp.y = 72;
			return temp;
		}

		private function __ActivetyAll_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/zonghe/xzt.png";
			temp.x = 628;
			temp.y = 276;
			return temp;
		}

		private function __ActivetyAll_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/zonghe/xzt.png";
			temp.x = 628;
			temp.y = 383;
			return temp;
		}

		private function __ActivetyAll_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/zonghe/hdjl.png";
			temp.x = 740;
			temp.y = 276;
			return temp;
		}

		private function __ActivetyAll_Skin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/zonghe/hdsm.png";
			temp.x = 740;
			temp.y = 384;
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
			temp.styleName = "ui/big_bg/activety/zonghe/des/1.jpg";
			temp.x = 629;
			temp.y = 78;
			return temp;
		}

		private function activeName_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			activeName = temp;
			temp.name = "activeName";
			temp.styleName = "ui/app/activety/zonghe/active_name/1.png";
			temp.x = 725;
			temp.y = 81;
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

		private function icon2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon2 = temp;
			temp.name = "icon2";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 713;
			temp.y = 315;
			return temp;
		}

		private function icon3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon3 = temp;
			temp.name = "icon3";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 783;
			temp.y = 315;
			return temp;
		}

		private function icon4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon4 = temp;
			temp.name = "icon4";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 853;
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
			temp.y = 416;
			return temp;
		}

	}
}