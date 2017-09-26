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

		public var imgWin:feathers.controls.UIAsset;

		public var lbMsg:feathers.controls.Label;

		public var lb_damagethan:feathers.controls.Label;

		public var lb_player_damage:feathers.controls.Label;

		public var numPaiming:feathers.controls.UINumber;

		public var uiWei:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function JiXianTiaoZhan_OK()
		{
			super();
			
			this.currentState = "normal";
			this.height = 508;
			this.width = 469;
			this.elementsContent = [__JiXianTiaoZhan_OK_UIAsset1_i(),imgWin_i(),__JiXianTiaoZhan_OK_UIAsset2_i(),__JiXianTiaoZhan_OK_UIAsset3_i(),__JiXianTiaoZhan_OK_UIAsset4_i(),grpIcon_i(),uiWei_i(),btnOk_i(),__JiXianTiaoZhan_OK_UIAsset5_i(),numPaiming_i(),__JiXianTiaoZhan_OK_Group1_i(),lb_player_damage_i(),lb_damagethan_i(),lbMsg_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __JiXianTiaoZhan_OK_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 113;
			temp.y = 217;
			temp.elementsContent = [__JiXianTiaoZhan_OK_UIAsset6_i(),__JiXianTiaoZhan_OK_UIAsset7_i(),__JiXianTiaoZhan_OK_UIAsset8_i()];
			return temp;
		}

		private function __JiXianTiaoZhan_OK_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 346;
			temp.styleName = "ui/app/activety/zonghe/ban1.png";
			temp.x = 0;
			temp.y = 162;
			return temp;
		}

		private function __JiXianTiaoZhan_OK_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 66;
			temp.styleName = "ui/app/activety/shijieboss/bantoukuang.png";
			temp.width = 384;
			temp.x = 43;
			temp.y = 239;
			return temp;
		}

		private function __JiXianTiaoZhan_OK_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/zonghe/tiao.png";
			temp.x = 41;
			temp.y = 305;
			return temp;
		}

		private function __JiXianTiaoZhan_OK_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/zonghe/qinlinmibao/huodejiangli.png";
			temp.x = 128;
			temp.y = 311;
			return temp;
		}

		private function __JiXianTiaoZhan_OK_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/wodepaiming.png";
			temp.x = 151;
			temp.y = 248;
			return temp;
		}

		private function __JiXianTiaoZhan_OK_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/shijieboss/shanghaitongji.png";
			temp.x = 79;
			temp.y = 0;
			return temp;
		}

		private function __JiXianTiaoZhan_OK_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/wenshi/huawen_1.png";
			temp.x = 0;
			temp.y = 11;
			return temp;
		}

		private function __JiXianTiaoZhan_OK_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/wenshi/huawen_2.png";
			temp.x = 175;
			temp.y = 11;
			return temp;
		}

		private function btnOk_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnOk = temp;
			temp.name = "btnOk";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "领取奖励";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xFFFFFF;
			temp.width = 120;
			temp.x = 175;
			temp.y = 451;
			return temp;
		}

		private function grpIcon_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpIcon = temp;
			temp.name = "grpIcon";
			temp.x = 198;
			temp.y = 346;
			temp.elementsContent = [icon1_i()];
			return temp;
		}

		private function icon1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon1 = temp;
			temp.name = "icon1";
			temp.styleName = "ui/common/grid/normal/64.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function imgWin_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgWin = temp;
			temp.name = "imgWin";
			temp.styleName = "ui/big_bg/activety/tianzhanshengli.png";
			temp.x = 59;
			temp.y = 0;
			return temp;
		}

		private function lbMsg_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbMsg = temp;
			temp.name = "lbMsg";
			temp.text = "成功击杀BOSS，可按排名获得奖励";
			temp.textAlign = "center";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 126;
			temp.y = 427;
			return temp;
		}

		private function lb_damagethan_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_damagethan = temp;
			temp.name = "lb_damagethan";
			temp.htmlText = "占总伤害：<font color='#00ff33'>100.0%</font>";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 263;
			temp.y = 281;
			return temp;
		}

		private function lb_player_damage_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_player_damage = temp;
			temp.name = "lb_player_damage";
			temp.htmlText = "累积伤害：<font color='#00ff33'>14964</font>";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 81;
			temp.y = 281;
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
			temp.y = 245;
			return temp;
		}

		private function uiWei_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiWei = temp;
			temp.name = "uiWei";
			temp.styleName = "ui/app/activety/shijieboss/weihuodejiangli.png";
			temp.x = 111;
			temp.y = 350;
			return temp;
		}

	}
}