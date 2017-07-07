package org.mokylin.skin.app.activety.zonghe
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
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
	public class TiaoZhanChengGong extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnOk:feathers.controls.Button;

		public var gExp:feathers.controls.Group;

		public var gMoney:feathers.controls.Group;

		public var gSW:feathers.controls.Group;

		public var gZQ:feathers.controls.Group;

		public var grpIcon:feathers.controls.Group;

		public var icon0:feathers.controls.UIAsset;

		public var icon1:feathers.controls.UIAsset;

		public var icon2:feathers.controls.UIAsset;

		public var icon3:feathers.controls.UIAsset;

		public var icon4:feathers.controls.UIAsset;

		public var icon5:feathers.controls.UIAsset;

		public var imLose:feathers.controls.UIAsset;

		public var imgWin:feathers.controls.UIAsset;

		public var numExp:feathers.controls.UINumber;

		public var numLingqi:feathers.controls.UINumber;

		public var numShengwang:feathers.controls.UINumber;

		public var numYuanbao:feathers.controls.UINumber;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TiaoZhanChengGong()
		{
			super();
			
			this.currentState = "normal";
			this.height = 534;
			this.width = 469;
			this.elementsContent = [__TiaoZhanChengGong_UIAsset1_i(),imLose_i(),imgWin_i(),__TiaoZhanChengGong_UIAsset2_i(),__TiaoZhanChengGong_UIAsset3_i(),gSW_i(),gZQ_i(),gMoney_i(),gExp_i(),btnOk_i(),grpIcon_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __TiaoZhanChengGong_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 372;
			temp.styleName = "ui/app/activety/zonghe/ban1.png";
			temp.x = 0;
			temp.y = 162;
			return temp;
		}

		private function __TiaoZhanChengGong_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/zonghe/tiao.png";
			temp.x = 35;
			temp.y = 373;
			return temp;
		}

		private function __TiaoZhanChengGong_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/zonghe/qinlinmibao/huodejiangli.png";
			temp.x = 142;
			temp.y = 379;
			return temp;
		}

		private function __TiaoZhanChengGong_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/zonghe/qinlinmibao/shanghaipaiming.png";
			temp.x = 0;
			temp.y = 1;
			return temp;
		}

		private function __TiaoZhanChengGong_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/zonghe/qinlinmibao/leijijifen.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __TiaoZhanChengGong_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/zonghe/qinlinmibao/huodezhenqi.png";
			temp.x = 0;
			temp.y = 1;
			return temp;
		}

		private function __TiaoZhanChengGong_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/zonghe/qinlinmibao/huodejingyan.png";
			temp.x = 0;
			temp.y = 2;
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
			temp.width = 110;
			temp.x = 179.5;
			temp.y = 481;
			return temp;
		}

		private function gExp_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			gExp = temp;
			temp.name = "gExp";
			temp.x = 123;
			temp.y = 322;
			temp.elementsContent = [__TiaoZhanChengGong_UIAsset7_i(),numExp_i()];
			return temp;
		}

		private function gMoney_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			gMoney = temp;
			temp.name = "gMoney";
			temp.x = 123;
			temp.y = 288;
			temp.elementsContent = [__TiaoZhanChengGong_UIAsset6_i(),numYuanbao_i()];
			return temp;
		}

		private function gSW_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			gSW = temp;
			temp.name = "gSW";
			temp.x = 123;
			temp.y = 217;
			temp.elementsContent = [__TiaoZhanChengGong_UIAsset4_i(),numShengwang_i()];
			return temp;
		}

		private function gZQ_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			gZQ = temp;
			temp.name = "gZQ";
			temp.x = 123;
			temp.y = 252;
			temp.elementsContent = [__TiaoZhanChengGong_UIAsset5_i(),numLingqi_i()];
			return temp;
		}

		private function grpIcon_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpIcon = temp;
			temp.name = "grpIcon";
			temp.x = 59;
			temp.y = 411;
			temp.elementsContent = [icon0_i(),icon1_i(),icon2_i(),icon3_i(),icon4_i(),icon5_i()];
			return temp;
		}

		private function icon0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon0 = temp;
			temp.name = "icon0";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 281;
			temp.y = 0;
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

		private function imLose_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imLose = temp;
			temp.name = "imLose";
			temp.styleName = "ui/app/activety/tiaozhanshibai.png";
			temp.visible = false;
			temp.x = 59;
			temp.y = 0;
			return temp;
		}

		private function imgWin_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgWin = temp;
			temp.name = "imgWin";
			temp.styleName = "ui/app/activety/tianzhanshengli.png";
			temp.x = 59;
			temp.y = 0;
			return temp;
		}

		private function numExp_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			numExp = temp;
			temp.name = "numExp";
			temp.gap = -3;
			temp.height = 25;
			temp.label = "300000";
			temp.styleClass = org.mokylin.skin.app.activety.number.UINumberTiaozhannum;
			temp.width = 160;
			temp.x = 104;
			temp.y = 0;
			return temp;
		}

		private function numLingqi_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			numLingqi = temp;
			temp.name = "numLingqi";
			temp.gap = -3;
			temp.height = 25;
			temp.label = "93750";
			temp.styleClass = org.mokylin.skin.app.activety.number.UINumberTiaozhannum;
			temp.width = 160;
			temp.x = 104;
			temp.y = 0;
			return temp;
		}

		private function numShengwang_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			numShengwang = temp;
			temp.name = "numShengwang";
			temp.gap = -3;
			temp.height = 25;
			temp.label = "50";
			temp.styleClass = org.mokylin.skin.app.activety.number.UINumberTiaozhannum;
			temp.width = 160;
			temp.x = 104;
			temp.y = 0;
			return temp;
		}

		private function numYuanbao_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			numYuanbao = temp;
			temp.name = "numYuanbao";
			temp.gap = -3;
			temp.height = 25;
			temp.label = "168750";
			temp.styleClass = org.mokylin.skin.app.activety.number.UINumberTiaozhannum;
			temp.width = 160;
			temp.x = 104;
			temp.y = 0;
			return temp;
		}

	}
}