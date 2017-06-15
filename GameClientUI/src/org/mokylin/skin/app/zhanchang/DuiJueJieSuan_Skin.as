package org.mokylin.skin.app.zhanchang
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.ProgressBar;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.app.zhanchang.dianfengduijue.ProDuiJue;
	import org.mokylin.skin.app.zhanchang.uinumber.UINumberNumhong;
	import org.mokylin.skin.app.zhanchang.uinumber.UINumberNumlv;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class DuiJueJieSuan_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnOk:feathers.controls.Button;

		public var grpEwai:feathers.controls.Group;

		public var grpJifen:feathers.controls.Group;

		public var imgLabWin:feathers.controls.UIAsset;

		public var imgWin:feathers.controls.UIAsset;

		public var lbDuanwei:feathers.controls.Label;

		public var lbDuihuan:feathers.controls.Label;

		public var lbTime:feathers.controls.Label;

		public var numJifen:feathers.controls.UINumber;

		public var numShengwang:feathers.controls.UINumber;

		public var proBar:feathers.controls.ProgressBar;

		public var uiIcon:feathers.controls.UIAsset;

		public var uiLevel:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function DuiJueJieSuan_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 430;
			this.width = 469;
			this.elementsContent = [__DuiJueJieSuan_Skin_UIAsset1_i(),imgWin_i(),__DuiJueJieSuan_Skin_UIAsset2_i(),imgLabWin_i(),uiIcon_i(),uiLevel_i(),grpJifen_i(),grpEwai_i(),btnOk_i(),lbTime_i(),__DuiJueJieSuan_Skin_UIAsset5_i(),proBar_i(),lbDuanwei_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __DuiJueJieSuan_Skin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "排位积分：";
			temp.color = 0xE1D4A9;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 5;
			return temp;
		}

		private function __DuiJueJieSuan_Skin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "额外奖励：";
			temp.color = 0xE1D4A9;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 5;
			return temp;
		}

		private function __DuiJueJieSuan_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 268;
			temp.styleName = "ui/app/zhanchang/jiesuan/ban1.png";
			temp.x = 0;
			temp.y = 162;
			return temp;
		}

		private function __DuiJueJieSuan_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/jiesuan/tiao.png";
			temp.x = 35;
			temp.y = 221;
			return temp;
		}

		private function __DuiJueJieSuan_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/jiesuan/jifen.png";
			temp.x = 72;
			temp.y = 0;
			return temp;
		}

		private function __DuiJueJieSuan_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/jiesuan/shengwang2.png";
			temp.x = 72;
			temp.y = 0;
			return temp;
		}

		private function __DuiJueJieSuan_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/jiesuan/jintutiaodi.png";
			temp.width = 255;
			temp.x = 107;
			temp.y = 293;
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
			temp.x = 177;
			temp.y = 378;
			return temp;
		}

		private function grpEwai_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpEwai = temp;
			temp.name = "grpEwai";
			temp.x = 149;
			temp.y = 345;
			temp.elementsContent = [__DuiJueJieSuan_Skin_UIAsset4_i(),numShengwang_i(),__DuiJueJieSuan_Skin_Label2_i(),lbDuihuan_i()];
			return temp;
		}

		private function grpJifen_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpJifen = temp;
			temp.name = "grpJifen";
			temp.x = 149;
			temp.y = 318;
			temp.elementsContent = [__DuiJueJieSuan_Skin_UIAsset3_i(),numJifen_i(),__DuiJueJieSuan_Skin_Label1_i()];
			return temp;
		}

		private function imgLabWin_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgLabWin = temp;
			temp.name = "imgLabWin";
			temp.styleName = "ui/app/zhanchang/jiesuan/gongxinin.png";
			temp.x = 142;
			temp.y = 225;
			return temp;
		}

		private function imgWin_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgWin = temp;
			temp.name = "imgWin";
			temp.styleName = "ui/app/zhanchang/jiesuan/tianzhanshengli.png";
			temp.x = 59;
			temp.y = 0;
			return temp;
		}

		private function lbDuanwei_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbDuanwei = temp;
			temp.name = "lbDuanwei";
			temp.text = "135/160";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 101;
			temp.x = 190;
			temp.y = 292;
			return temp;
		}

		private function lbDuihuan_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbDuihuan = temp;
			temp.name = "lbDuihuan";
			temp.text = "声望兑换";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = true;
			temp.x = 181;
			temp.y = 5;
			return temp;
		}

		private function lbTime_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTime = temp;
			temp.name = "lbTime";
			temp.text = "19s后自动关闭";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 102;
			temp.x = 297;
			temp.y = 383;
			return temp;
		}

		private function numJifen_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			numJifen = temp;
			temp.name = "numJifen";
			temp.gap = -4;
			temp.height = 25;
			temp.label = "x60";
			temp.styleClass = org.mokylin.skin.app.zhanchang.uinumber.UINumberNumlv;
			temp.width = 96;
			temp.x = 120;
			temp.y = 0;
			return temp;
		}

		private function numShengwang_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			numShengwang = temp;
			temp.name = "numShengwang";
			temp.gap = -4;
			temp.height = 25;
			temp.label = "x60";
			temp.styleClass = org.mokylin.skin.app.zhanchang.uinumber.UINumberNumhong;
			temp.width = 96;
			temp.x = 120;
			temp.y = 0;
			return temp;
		}

		private function proBar_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			proBar = temp;
			temp.name = "proBar";
			temp.styleClass = org.mokylin.skin.app.zhanchang.dianfengduijue.ProDuiJue;
			temp.value = 80;
			temp.x = 114;
			temp.y = 296;
			return temp;
		}

		private function uiIcon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiIcon = temp;
			temp.name = "uiIcon";
			temp.styleName = "ui/app/zhanchang/icon/1001_24.png";
			temp.x = 193;
			temp.y = 263;
			return temp;
		}

		private function uiLevel_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiLevel = temp;
			temp.name = "uiLevel";
			temp.styleName = "ui/app/zhanchang/icon/name2/1001.png";
			temp.x = 218;
			temp.y = 263;
			return temp;
		}

	}
}