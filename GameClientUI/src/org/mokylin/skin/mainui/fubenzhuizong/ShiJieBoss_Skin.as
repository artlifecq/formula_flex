package org.mokylin.skin.mainui.fubenzhuizong
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_hide;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ShiJieBoss_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn_close:feathers.controls.Button;

		public var btn_open:feathers.controls.Button;

		public var headName:feathers.controls.Label;

		public var head_left:feathers.controls.UIAsset;

		public var head_right:feathers.controls.UIAsset;

		public var lbTime:feathers.controls.Label;

		public var sec_ico1_0:feathers.controls.UIAsset;

		public var sec_info:feathers.controls.Label;

		public var sec_navi0:feathers.controls.Label;

		public var sec_navi1:feathers.controls.Label;

		public var sec_subbut1:feathers.controls.Button;

		public var sec_subbut2:feathers.controls.Button;

		public var task_box:feathers.controls.Group;

		public var uiWeiJiSha:feathers.controls.UIAsset;

		public var uiYiTiaoZhan:feathers.controls.UIAsset;

		public var ui_bg:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ShiJieBoss_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 328;
			this.width = 253;
			this.elementsContent = [task_box_i(),btn_open_i(),btn_close_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __ShiJieBoss_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/renwu/renwuzhuizongbg.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btn_close_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_close = temp;
			temp.name = "btn_close";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_hide;
			temp.x = 221;
			temp.y = 8;
			return temp;
		}

		private function btn_open_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_open = temp;
			temp.name = "btn_open";
			temp.scaleX = -1;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_hide;
			temp.x = 243;
			temp.y = 8;
			return temp;
		}

		private function headName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			headName = temp;
			temp.name = "headName";
			temp.fontSize = 16;
			temp.text = "超级BOSS";
			temp.textAlign = "center";
			temp.color = 0xFFF2B7;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlue"];
			temp.width = 205;
			temp.x = 24;
			temp.y = 8;
			return temp;
		}

		private function head_left_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			head_left = temp;
			temp.name = "head_left";
			temp.height = 10;
			temp.styleName = "ui/mainui/fubenzhuizong/zs.png";
			temp.width = 45;
			temp.x = 40;
			temp.y = 15;
			return temp;
		}

		private function head_right_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			head_right = temp;
			temp.name = "head_right";
			temp.height = 10;
			temp.scaleX = -1;
			temp.styleName = "ui/mainui/fubenzhuizong/zs.png";
			temp.width = 45;
			temp.x = 213;
			temp.y = 15;
			return temp;
		}

		private function lbTime_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTime = temp;
			temp.name = "lbTime";
			temp.text = "10:10";
			temp.textAlign = "center";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 236;
			temp.x = 6;
			temp.y = 78;
			return temp;
		}

		private function sec_ico1_0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico1_0 = temp;
			temp.name = "sec_ico1_0";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 98;
			temp.y = 167;
			return temp;
		}

		private function sec_info_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			sec_info = temp;
			temp.name = "sec_info";
			temp.letterSpacing = 0;
			temp.fontSize = 14;
			temp.text = "下次刷新时间：00：22：08";
			temp.textAlign = "center";
			temp.color = 0xFF0D0D;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 190;
			temp.x = 31;
			temp.y = 135;
			return temp;
		}

		private function sec_navi0_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			sec_navi0 = temp;
			temp.name = "sec_navi0";
			temp.htmlText = "【当前刷新状态】";
			temp.color = 0xffea00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 10;
			temp.y = 106;
			return temp;
		}

		private function sec_navi1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			sec_navi1 = temp;
			temp.name = "sec_navi1";
			temp.htmlText = "【每日刷新时间】";
			temp.color = 0xffea00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 10;
			temp.y = 51;
			return temp;
		}

		private function sec_subbut1_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			sec_subbut1 = temp;
			temp.name = "sec_subbut1";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "自动寻路";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xEAEABC;
			temp.width = 88;
			temp.x = 30;
			temp.y = 239;
			return temp;
		}

		private function sec_subbut2_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			sec_subbut2 = temp;
			temp.name = "sec_subbut2";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "退出地图";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xEAEABC;
			temp.width = 88;
			temp.x = 139;
			temp.y = 239;
			return temp;
		}

		private function task_box_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			task_box = temp;
			temp.name = "task_box";
			temp.height = 328;
			temp.width = 253;
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [ui_bg_i(),__ShiJieBoss_Skin_UIAsset1_i(),headName_i(),head_left_i(),head_right_i(),sec_navi1_i(),sec_navi0_i(),sec_ico1_0_i(),sec_subbut1_i(),sec_subbut2_i(),sec_info_i(),lbTime_i(),uiYiTiaoZhan_i(),uiWeiJiSha_i()];
			return temp;
		}

		private function uiWeiJiSha_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiWeiJiSha = temp;
			temp.name = "uiWeiJiSha";
			temp.styleName = "ui/art_txt/common/weijisha.png";
			temp.x = 92;
			temp.y = 131;
			return temp;
		}

		private function uiYiTiaoZhan_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiYiTiaoZhan = temp;
			temp.name = "uiYiTiaoZhan";
			temp.styleName = "ui/common/yijisha2.png";
			temp.x = 168;
			temp.y = 40;
			return temp;
		}

		private function ui_bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ui_bg = temp;
			temp.name = "ui_bg";
			temp.height = 295;
			temp.styleName = "ui/mainui/renwu/bg.png";
			temp.width = 248;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}