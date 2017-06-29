package org.mokylin.skin.app.banghui
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.text.TextFieldTextEditor;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.ProgressBar;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.banghui.ProJindu_Dengji;
	import org.mokylin.skin.app.banghui.button.ButtonHuangcheng;
	import org.mokylin.skin.app.banghui.button.ButtonWangcheng;
	import org.mokylin.skin.app.banghui.button.ButtonWeicheng;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;
	
	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class BangHui_Info_left extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnHuangcheng:feathers.controls.Button;
		
		public var btnJuanxian:feathers.controls.Button;
		
		public var btnUp:feathers.controls.Button;
		
		public var btnWangcheng:feathers.controls.Button;
		
		public var btnWeicheng:feathers.controls.Button;
		
		public var lbJindu:feathers.controls.Label;
		
		public var lbLevel:feathers.controls.Label;
		
		public var lbList:feathers.controls.Label;
		
		public var lbName:feathers.controls.Label;
		
		public var lbNum:feathers.controls.Label;
		
		public var lbXuanYan:feathers.controls.text.TextFieldTextEditor;
		
		public var lbZhanli:feathers.controls.Label;
		
		public var proJindu:feathers.controls.ProgressBar;
		
		
		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function BangHui_Info_left()
		{
			super();
			
			this.currentState = "normal";
			this.height = 504;
			this.width = 269;
			this.elementsContent = [__BangHui_Info_left_UIAsset1_i(),__BangHui_Info_left_UIAsset2_i(),__BangHui_Info_left_UIAsset3_i(),__BangHui_Info_left_UIAsset4_i(),lbName_i(),__BangHui_Info_left_Label1_i(),__BangHui_Info_left_Label2_i(),__BangHui_Info_left_Label3_i(),__BangHui_Info_left_Label4_i(),__BangHui_Info_left_Label5_i(),lbZhanli_i(),lbLevel_i(),lbList_i(),lbNum_i(),__BangHui_Info_left_UIAsset5_i(),proJindu_i(),lbJindu_i(),btnUp_i(),btnJuanxian_i(),lbXuanYan_i(),__BangHui_Info_left_Group1_i(),btnWeicheng_i(),btnWangcheng_i(),btnHuangcheng_i(),__BangHui_Info_left_UIAsset9_i()];
			
			states = {
			};
			skinNames={};
		}
		
		
		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __BangHui_Info_left_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 13;
			temp.y = 388;
			temp.elementsContent = [__BangHui_Info_left_UIAsset6_i(),__BangHui_Info_left_UIAsset7_i(),__BangHui_Info_left_UIAsset8_i()];
			return temp;
		}
		
		private function __BangHui_Info_left_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "帮派战力：";
			temp.color = 0xD2CA78;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 46;
			temp.y = 75;
			return temp;
		}
		
		private function __BangHui_Info_left_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "帮派等级：";
			temp.color = 0xD2CA78;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 46;
			temp.y = 96;
			return temp;
		}
		
		private function __BangHui_Info_left_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "帮派排名：";
			temp.color = 0xD2CA78;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 46;
			temp.y = 117;
			return temp;
		}
		
		private function __BangHui_Info_left_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "帮派成员：";
			temp.color = 0xD2CA78;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 46;
			temp.y = 138;
			return temp;
		}
		
		private function __BangHui_Info_left_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "帮派活跃：";
			temp.color = 0xD2CA78;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 46;
			temp.y = 159;
			return temp;
		}
		
		private function __BangHui_Info_left_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/banghui/bg1_left.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}
		
		private function __BangHui_Info_left_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/titlebg1.png";
			temp.x = 5;
			temp.y = 5;
			return temp;
		}
		
		private function __BangHui_Info_left_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 218;
			temp.styleName = "ui/app/banghui/kuang2.png";
			temp.width = 205;
			temp.x = 32;
			temp.y = 42;
			return temp;
		}
		
		private function __BangHui_Info_left_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 110;
			temp.styleName = "ui/app/banghui/kuang2.png";
			temp.width = 205;
			temp.x = 32;
			temp.y = 267;
			return temp;
		}
		
		private function __BangHui_Info_left_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/jindutiaobg1.png";
			temp.width = 180;
			temp.x = 44;
			temp.y = 187;
			return temp;
		}
		
		private function __BangHui_Info_left_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/word/bangpaizhanlinchengchi.png";
			temp.x = 76;
			temp.y = 0;
			return temp;
		}
		
		private function __BangHui_Info_left_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/huawen1.png";
			temp.x = 0;
			temp.y = 4;
			return temp;
		}
		
		private function __BangHui_Info_left_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.scaleX = -1;
			temp.styleName = "ui/app/banghui/huawen1.png";
			temp.x = 244;
			temp.y = 4;
			return temp;
		}
		
		private function __BangHui_Info_left_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/word/xiangxixinxi.png";
			temp.x = 105.5;
			temp.y = 11;
			return temp;
		}
		
		private function btnHuangcheng_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnHuangcheng = temp;
			temp.name = "btnHuangcheng";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.styleClass = org.mokylin.skin.app.banghui.button.ButtonHuangcheng;
			temp.color = 0xCFC6AE;
			temp.x = 172;
			temp.y = 412;
			return temp;
		}
		
		private function btnJuanxian_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnJuanxian = temp;
			temp.name = "btnJuanxian";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "捐献";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xCFC6AE;
			temp.x = 143;
			temp.y = 216;
			return temp;
		}
		
		private function btnUp_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnUp = temp;
			temp.name = "btnUp";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "升级";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xCFC6AE;
			temp.x = 52;
			temp.y = 216;
			return temp;
		}
		
		private function btnWangcheng_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnWangcheng = temp;
			temp.name = "btnWangcheng";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.styleClass = org.mokylin.skin.app.banghui.button.ButtonWangcheng;
			temp.color = 0xCFC6AE;
			temp.x = 102;
			temp.y = 412;
			return temp;
		}
		
		private function btnWeicheng_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnWeicheng = temp;
			temp.name = "btnWeicheng";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.styleClass = org.mokylin.skin.app.banghui.button.ButtonWeicheng;
			temp.color = 0xCFC6AE;
			temp.x = 29;
			temp.y = 412;
			return temp;
		}
		
		private function lbJindu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbJindu = temp;
			temp.name = "lbJindu";
			temp.fontSize = 12;
			temp.text = "5000/10000";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 137;
			temp.x = 66;
			temp.y = 188;
			return temp;
		}
		
		private function lbLevel_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbLevel = temp;
			temp.name = "lbLevel";
			temp.text = "99级";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 109;
			temp.x = 120;
			temp.y = 96;
			return temp;
		}
		
		private function lbList_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbList = temp;
			temp.name = "lbList";
			temp.text = "100";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 109;
			temp.x = 120;
			temp.y = 117;
			return temp;
		}
		
		private function lbName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName = temp;
			temp.name = "lbName";
			temp.text = "帮派名称七个字";
			temp.color = 0xD2CA78;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 180;
			temp.x = 47;
			temp.y = 54;
			return temp;
		}
		
		private function lbNum_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbNum = temp;
			temp.name = "lbNum";
			temp.text = "900/999";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 109;
			temp.x = 120;
			temp.y = 138;
			return temp;
		}
		
		private function lbXuanYan_i():feathers.controls.text.TextFieldTextEditor
		{
			var temp:feathers.controls.text.TextFieldTextEditor = new feathers.controls.text.TextFieldTextEditor();
			lbXuanYan = temp;
			temp.name = "lbXuanYan";
			temp.height = 91;
			temp.text = "帮派宣言：50个字帮派宣言：50个字帮派宣言：50个字帮派宣言：50个字";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 181;
			temp.x = 43;
			temp.y = 276;
			return temp;
		}
		
		private function lbZhanli_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbZhanli = temp;
			temp.name = "lbZhanli";
			temp.text = "9999999999";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 109;
			temp.x = 120;
			temp.y = 75;
			return temp;
		}
		
		private function proJindu_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			proJindu = temp;
			temp.name = "proJindu";
			temp.styleClass = org.mokylin.skin.app.banghui.ProJindu_Dengji;
			temp.value = 50;
			temp.x = 54;
			temp.y = 191;
			return temp;
		}
		
	}
}