package org.mokylin.skin.app.activety.shijieboss
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
	public class TiaoZhanShengLi extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnOk:feathers.controls.Button;

		public var grpIcon:feathers.controls.Group;

		public var icon1:feathers.controls.UIAsset;

		public var imgWin:feathers.controls.UIAsset;

		public var numPaiming:feathers.controls.UINumber;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TiaoZhanShengLi()
		{
			super();
			
			this.currentState = "normal";
			this.height = 422;
			this.width = 469;
			this.elementsContent = [__TiaoZhanShengLi_UIAsset1_i(),imgWin_i(),__TiaoZhanShengLi_UIAsset2_i(),__TiaoZhanShengLi_UIAsset3_i(),grpIcon_i(),btnOk_i(),__TiaoZhanShengLi_UIAsset4_i(),numPaiming_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __TiaoZhanShengLi_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 260;
			temp.styleName = "ui/app/activety/zonghe/ban1.png";
			temp.x = 0;
			temp.y = 162;
			return temp;
		}

		private function __TiaoZhanShengLi_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/zonghe/tiao.png";
			temp.x = 35;
			temp.y = 244;
			return temp;
		}

		private function __TiaoZhanShengLi_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/zonghe/qinlinmibao/huodejiangli.png";
			temp.x = 142;
			temp.y = 250;
			return temp;
		}

		private function __TiaoZhanShengLi_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/wodepaiming.png";
			temp.x = 151;
			temp.y = 206;
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
			temp.x = 175;
			temp.y = 367;
			return temp;
		}

		private function grpIcon_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpIcon = temp;
			temp.name = "grpIcon";
			temp.x = 59;
			temp.y = 286;
			temp.elementsContent = [icon1_i()];
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
			temp.y = 203;
			return temp;
		}

	}
}