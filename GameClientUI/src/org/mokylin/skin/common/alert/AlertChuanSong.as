package org.mokylin.skin.common.alert
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.common.TongYongTanKuang_bg;
	import org.mokylin.skin.component.button.ButtonSkin_close;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class AlertChuanSong extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.SkinnableContainer;

		public var btnClose:feathers.controls.Button;

		public var icon1:feathers.controls.UIAsset;

		public var icon2:feathers.controls.UIAsset;

		public var lb_role1:feathers.controls.Label;

		public var lb_role2:feathers.controls.Label;

		public var lb_text:feathers.controls.Label;

		public var lb_text2:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function AlertChuanSong()
		{
			super();
			
			this.currentState = "normal";
			this.height = 264;
			this.width = 326;
			this.elementsContent = [bg_i(),__AlertChuanSong_UIAsset1_i(),btnClose_i(),lb_text_i(),lb_text2_i(),lb_role1_i(),lb_role2_i(),__AlertChuanSong_UIAsset2_i(),icon1_i(),icon2_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __AlertChuanSong_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 222;
			temp.styleName = "ui/common/background/neikuang_1.png";
			temp.width = 312;
			temp.x = 7;
			temp.y = 34;
			return temp;
		}

		private function __AlertChuanSong_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/art_txt/common/background/quntichuansong.png";
			temp.x = 121;
			temp.y = 5;
			return temp;
		}

		private function bg_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			bg = temp;
			temp.name = "bg";
			temp.height = 264;
			var skin:StateSkin = new org.mokylin.skin.common.TongYongTanKuang_bg()
			temp.skin = skin
			temp.width = 326;
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
			temp.x = 293;
			temp.y = 5;
			return temp;
		}

		private function icon1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon1 = temp;
			temp.name = "icon1";
			temp.styleName = "ui/common/quan2.png";
			temp.x = 60;
			temp.y = 104;
			return temp;
		}

		private function icon2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon2 = temp;
			temp.name = "icon2";
			temp.styleName = "ui/common/quan2.png";
			temp.x = 190;
			temp.y = 104;
			return temp;
		}

		private function lb_role1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_role1 = temp;
			temp.name = "lb_role1";
			temp.leading = 4;
			temp.letterSpacing = 0;
			temp.fontSize = 14;
			temp.text = "玩家名字六子";
			temp.textAlign = "center";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.verticalAlign = "middle";
			temp.width = 106;
			temp.x = 44;
			temp.y = 185;
			return temp;
		}

		private function lb_role2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_role2 = temp;
			temp.name = "lb_role2";
			temp.leading = 4;
			temp.letterSpacing = 0;
			temp.fontSize = 14;
			temp.text = "玩家名字六子";
			temp.textAlign = "center";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.verticalAlign = "middle";
			temp.width = 106;
			temp.x = 175;
			temp.y = 185;
			return temp;
		}

		private function lb_text2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_text2 = temp;
			temp.name = "lb_text2";
			temp.leading = 4;
			temp.letterSpacing = 0;
			temp.fontSize = 14;
			temp.text = "点击头像传送到统帅身边";
			temp.textAlign = "center";
			temp.color = 0x00FF0C;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.verticalAlign = "middle";
			temp.width = 284;
			temp.x = 21;
			temp.y = 216;
			return temp;
		}

		private function lb_text_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_text = temp;
			temp.name = "lb_text";
			temp.height = 50;
			temp.leading = 4;
			temp.letterSpacing = 0;
			temp.fontSize = 14;
			temp.text = "以下统帅向大家发出集体号召，是否相应";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.verticalAlign = "middle";
			temp.width = 284;
			temp.x = 21;
			temp.y = 48;
			return temp;
		}

	}
}