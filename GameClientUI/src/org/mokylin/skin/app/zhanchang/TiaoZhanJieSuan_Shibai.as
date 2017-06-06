package org.mokylin.skin.app.zhanchang
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.app.zhanchang.uinumber.UINumberNumber;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TiaoZhanJieSuan_Shibai extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnOk:feathers.controls.Button;

		public var numExp:feathers.controls.UINumber;

		public var numLingqi:feathers.controls.UINumber;

		public var numPaiming:feathers.controls.UINumber;

		public var numShengwang:feathers.controls.UINumber;

		public var numYuanbao:feathers.controls.UINumber;

		public var uiExp:feathers.controls.UIAsset;

		public var uiLingqi:feathers.controls.UIAsset;

		public var uiShengwang:feathers.controls.UIAsset;

		public var uiYuanbao:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TiaoZhanJieSuan_Shibai()
		{
			super();
			
			this.currentState = "normal";
			this.height = 479;
			this.width = 469;
			this.elementsContent = [__TiaoZhanJieSuan_Shibai_UIAsset1_i(),__TiaoZhanJieSuan_Shibai_UIAsset2_i(),__TiaoZhanJieSuan_Shibai_UIAsset3_i(),__TiaoZhanJieSuan_Shibai_UIAsset4_i(),__TiaoZhanJieSuan_Shibai_UIAsset5_i(),__TiaoZhanJieSuan_Shibai_UIAsset6_i(),__TiaoZhanJieSuan_Shibai_UIAsset7_i(),__TiaoZhanJieSuan_Shibai_UIAsset8_i(),__TiaoZhanJieSuan_Shibai_UIAsset9_i(),uiExp_i(),uiLingqi_i(),uiShengwang_i(),uiYuanbao_i(),numPaiming_i(),numShengwang_i(),numLingqi_i(),numYuanbao_i(),numExp_i(),btnOk_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __TiaoZhanJieSuan_Shibai_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 317;
			temp.styleName = "ui/app/zhanchang/jiesuan/ban1.png";
			temp.x = 0;
			temp.y = 162;
			return temp;
		}

		private function __TiaoZhanJieSuan_Shibai_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/jiesuan/tiaozhanshibai.png";
			temp.x = 59;
			temp.y = 0;
			return temp;
		}

		private function __TiaoZhanJieSuan_Shibai_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/jiesuan/tiao.png";
			temp.x = 35;
			temp.y = 243;
			return temp;
		}

		private function __TiaoZhanJieSuan_Shibai_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/jiesuan/tiaozhan.png";
			temp.x = 142;
			temp.y = 250;
			return temp;
		}

		private function __TiaoZhanJieSuan_Shibai_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/jiesuan/wodepaiming.png";
			temp.x = 151;
			temp.y = 206;
			return temp;
		}

		private function __TiaoZhanJieSuan_Shibai_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/jiesuan/shengwang.png";
			temp.x = 165;
			temp.y = 290;
			return temp;
		}

		private function __TiaoZhanJieSuan_Shibai_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/jiesuan/zhenqi.png";
			temp.x = 165;
			temp.y = 321;
			return temp;
		}

		private function __TiaoZhanJieSuan_Shibai_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/jiesuan/bangyin.png";
			temp.x = 165;
			temp.y = 352;
			return temp;
		}

		private function __TiaoZhanJieSuan_Shibai_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/jiesuan/jingyan.png";
			temp.x = 165;
			temp.y = 383;
			return temp;
		}

		private function btnOk_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnOk = temp;
			temp.name = "btnOk";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "确认";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xCFC6AE;
			temp.width = 112;
			temp.x = 175;
			temp.y = 425;
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
			temp.styleClass = org.mokylin.skin.app.zhanchang.uinumber.UINumberNumber;
			temp.width = 160;
			temp.x = 241;
			temp.y = 381;
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
			temp.styleClass = org.mokylin.skin.app.zhanchang.uinumber.UINumberNumber;
			temp.width = 160;
			temp.x = 241;
			temp.y = 321;
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
			temp.styleClass = org.mokylin.skin.app.zhanchang.uinumber.UINumberNumber;
			temp.width = 160;
			temp.x = 256;
			temp.y = 203;
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
			temp.styleClass = org.mokylin.skin.app.zhanchang.uinumber.UINumberNumber;
			temp.width = 160;
			temp.x = 241;
			temp.y = 289;
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
			temp.styleClass = org.mokylin.skin.app.zhanchang.uinumber.UINumberNumber;
			temp.width = 160;
			temp.x = 241;
			temp.y = 351;
			return temp;
		}

		private function uiExp_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiExp = temp;
			temp.name = "uiExp";
			temp.styleName = "ui/common/tubiao/exp.png";
			temp.x = 137;
			temp.y = 384;
			return temp;
		}

		private function uiLingqi_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiLingqi = temp;
			temp.name = "uiLingqi";
			temp.styleName = "ui/common/tubiao/lingqi_24.png";
			temp.x = 137;
			temp.y = 322;
			return temp;
		}

		private function uiShengwang_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiShengwang = temp;
			temp.name = "uiShengwang";
			temp.styleName = "ui/common/tubiao/shengwang.png";
			temp.x = 137;
			temp.y = 291;
			return temp;
		}

		private function uiYuanbao_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiYuanbao = temp;
			temp.name = "uiYuanbao";
			temp.styleName = "ui/common/tubiao/yinzib_24.png";
			temp.x = 137;
			temp.y = 353;
			return temp;
		}

	}
}