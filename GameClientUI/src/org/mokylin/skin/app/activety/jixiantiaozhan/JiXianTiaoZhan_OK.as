package org.mokylin.skin.app.activety.jixiantiaozhan
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.app.activety.number.UINumberTiaozhannum;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class JiXianTiaoZhan_OK extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnOk:feathers.controls.Button;

		public var grpIcon:feathers.controls.Group;

		public var icon1:feathers.controls.UIAsset;

		public var icon2:feathers.controls.UIAsset;

		public var icon3:feathers.controls.UIAsset;

		public var icon4:feathers.controls.UIAsset;

		public var icon5:feathers.controls.UIAsset;

		public var icon6:feathers.controls.UIAsset;

		public var imgWin:feathers.controls.UIAsset;

		public var lb_damagethan:feathers.controls.Label;

		public var lb_player_damage:feathers.controls.Label;

		public var numPaiming:feathers.controls.UINumber;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function JiXianTiaoZhan_OK()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__JiXianTiaoZhan_OK_UIAsset1_i(),imgWin_i(),__JiXianTiaoZhan_OK_UIAsset2_i(),__JiXianTiaoZhan_OK_UIAsset3_i(),grpIcon_i(),btnOk_i(),__JiXianTiaoZhan_OK_UIAsset4_i(),numPaiming_i(),__JiXianTiaoZhan_OK_Label1_i(),lb_player_damage_i(),lb_damagethan_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __JiXianTiaoZhan_OK_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "本次极限挑战活动中";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 173;
			temp.y = 230;
			return temp;
		}

		private function __JiXianTiaoZhan_OK_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 292;
			temp.styleName = "ui/app/activety/zonghe/ban1.png";
			temp.x = 0;
			temp.y = 152;
			return temp;
		}

		private function __JiXianTiaoZhan_OK_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/zonghe/tiao.png";
			temp.x = 40.5;
			temp.y = 296;
			return temp;
		}

		private function __JiXianTiaoZhan_OK_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/zonghe/qinlinmibao/huodejiangli.png";
			temp.x = 127.5;
			temp.y = 302;
			return temp;
		}

		private function __JiXianTiaoZhan_OK_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/wodepaiming.png";
			temp.x = 151;
			temp.y = 201;
			return temp;
		}

		private function btnOk_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnOk = temp;
			temp.name = "btnOk";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "领取奖励";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xCFC6AE;
			temp.width = 112;
			temp.x = 178.5;
			temp.y = 392;
			return temp;
		}

		private function grpIcon_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpIcon = temp;
			temp.name = "grpIcon";
			temp.x = 64;
			temp.y = 328;
			temp.elementsContent = [icon1_i(),icon2_i(),icon3_i(),icon4_i(),icon5_i(),icon6_i()];
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
			temp.x = 56;
			temp.y = 0;
			return temp;
		}

		private function icon3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon3 = temp;
			temp.name = "icon3";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 112;
			temp.y = 0;
			return temp;
		}

		private function icon4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon4 = temp;
			temp.name = "icon4";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 169;
			temp.y = 0;
			return temp;
		}

		private function icon5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon5 = temp;
			temp.name = "icon5";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 225;
			temp.y = 0;
			return temp;
		}

		private function icon6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon6 = temp;
			temp.name = "icon6";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 281;
			temp.y = 0;
			return temp;
		}

		private function imgWin_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgWin = temp;
			temp.name = "imgWin";
			temp.styleName = "ui/app/activety/tianzhanshengli.png";
			temp.x = 28;
			temp.y = -38;
			return temp;
		}

		private function lb_damagethan_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_damagethan = temp;
			temp.name = "lb_damagethan";
			temp.text = "占总伤害:$";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 140;
			temp.x = 173;
			temp.y = 270;
			return temp;
		}

		private function lb_player_damage_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_player_damage = temp;
			temp.name = "lb_player_damage";
			temp.text = "累积伤害:$";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 140;
			temp.x = 173;
			temp.y = 251;
			return temp;
		}

		private function numPaiming_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			numPaiming = temp;
			temp.name = "numPaiming";
			temp.gap = -3;
			temp.height = 25;
			temp.label = "1168";
			temp.styleClass = org.mokylin.skin.app.activety.number.UINumberTiaozhannum;
			temp.width = 82;
			temp.x = 256;
			temp.y = 198;
			return temp;
		}

	}
}