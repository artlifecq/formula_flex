package org.mokylin.skin.app.zhanchang
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class JiuCengYaoTaJieSuan extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnOk:feathers.controls.Button;

		public var icon1:feathers.controls.UIAsset;

		public var icon2:feathers.controls.UIAsset;

		public var icon3:feathers.controls.UIAsset;

		public var icon4:feathers.controls.UIAsset;

		public var lbPaiming:feathers.controls.Label;

		public var lbTime:feathers.controls.Label;

		public var lbZhanli:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function JiuCengYaoTaJieSuan()
		{
			super();
			
			this.currentState = "normal";
			this.height = 349;
			this.width = 469;
			this.elementsContent = [__JiuCengYaoTaJieSuan_UIAsset1_i(),__JiuCengYaoTaJieSuan_UIAsset2_i(),__JiuCengYaoTaJieSuan_UIAsset3_i(),__JiuCengYaoTaJieSuan_UIAsset4_i(),icon1_i(),icon2_i(),icon3_i(),icon4_i(),btnOk_i(),lbTime_i(),__JiuCengYaoTaJieSuan_Label1_i(),__JiuCengYaoTaJieSuan_Label2_i(),lbZhanli_i(),lbPaiming_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __JiuCengYaoTaJieSuan_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "我的战力：";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 79;
			temp.y = 152;
			return temp;
		}

		private function __JiuCengYaoTaJieSuan_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "积分排名：";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 258;
			temp.y = 152;
			return temp;
		}

		private function __JiuCengYaoTaJieSuan_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 245;
			temp.styleName = "ui/app/zhanchang/jiesuan/ban1.png";
			temp.x = 0;
			temp.y = 104;
			return temp;
		}

		private function __JiuCengYaoTaJieSuan_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/jiucengyaota/zhanchangjiesuan.png";
			temp.x = 52;
			temp.y = 0;
			return temp;
		}

		private function __JiuCengYaoTaJieSuan_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/jiesuan/tiao.png";
			temp.x = 35;
			temp.y = 177;
			return temp;
		}

		private function __JiuCengYaoTaJieSuan_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/jiesuan/tiaozhan.png";
			temp.x = 142;
			temp.y = 184;
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
			temp.y = 295;
			return temp;
		}

		private function icon1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon1 = temp;
			temp.name = "icon1";
			temp.styleName = "ui/common/grid/normal/64.png";
			temp.x = 74;
			temp.y = 215;
			return temp;
		}

		private function icon2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon2 = temp;
			temp.name = "icon2";
			temp.styleName = "ui/common/grid/normal/64.png";
			temp.x = 157;
			temp.y = 215;
			return temp;
		}

		private function icon3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon3 = temp;
			temp.name = "icon3";
			temp.styleName = "ui/common/grid/normal/64.png";
			temp.x = 240;
			temp.y = 215;
			return temp;
		}

		private function icon4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon4 = temp;
			temp.name = "icon4";
			temp.styleName = "ui/common/grid/normal/64.png";
			temp.x = 323;
			temp.y = 215;
			return temp;
		}

		private function lbPaiming_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbPaiming = temp;
			temp.name = "lbPaiming";
			temp.text = "1000000000";
			temp.color = 0xBEA757;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 82;
			temp.x = 328;
			temp.y = 152;
			return temp;
		}

		private function lbTime_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTime = temp;
			temp.name = "lbTime";
			temp.text = "7秒后自动关闭";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 104;
			temp.x = 286;
			temp.y = 310;
			return temp;
		}

		private function lbZhanli_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbZhanli = temp;
			temp.name = "lbZhanli";
			temp.text = "1000000000";
			temp.color = 0xBEA757;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 82;
			temp.x = 149;
			temp.y = 152;
			return temp;
		}

	}
}