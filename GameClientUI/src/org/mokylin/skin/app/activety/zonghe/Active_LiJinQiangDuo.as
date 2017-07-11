package org.mokylin.skin.app.activety.zonghe
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.app.activety.number.UINumberNum;
	import org.mokylin.skin.component.button.ButtonSkin_shouhui;
	import org.mokylin.skin.component.button.ButtonSkin_zhankai;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Active_LiJinQiangDuo extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn_close:feathers.controls.Button;

		public var btn_open:feathers.controls.Button;

		public var grpshuaxin:feathers.controls.Group;

		public var grpto:feathers.controls.Group;

		public var head_left:feathers.controls.UIAsset;

		public var head_right:feathers.controls.UIAsset;

		public var icon:feathers.controls.UIAsset;

		public var lbHeadName:feathers.controls.Label;

		public var lbName:feathers.controls.Label;

		public var lbName2:feathers.controls.Label;

		public var lbOk:feathers.controls.Label;

		public var lbPaiHang:feathers.controls.Label;

		public var lbTime:feathers.controls.Label;

		public var lbTo:feathers.controls.Label;

		public var numLiJin:feathers.controls.UINumber;

		public var task_box:feathers.controls.Group;

		public var uiJia:feathers.controls.UIAsset;

		public var ui_bg:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Active_LiJinQiangDuo()
		{
			super();
			
			this.currentState = "normal";
			this.height = 212;
			this.width = 253;
			this.elementsContent = [task_box_i(),btn_open_i(),btn_close_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Active_LiJinQiangDuo_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "刷新时间：";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = false;
			temp.width = 76;
			temp.x = 0;
			temp.y = 20;
			return temp;
		}

		private function __Active_LiJinQiangDuo_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "累积获得绑定元宝：";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 140;
			temp.x = 21;
			temp.y = 85;
			return temp;
		}

		private function __Active_LiJinQiangDuo_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/renwu/hengtiao.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __Active_LiJinQiangDuo_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/zonghe/tianjianglijin/bg.png";
			temp.x = 15;
			temp.y = 126;
			return temp;
		}

		private function btn_close_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_close = temp;
			temp.name = "btn_close";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_shouhui;
			temp.x = 234;
			temp.y = 0;
			return temp;
		}

		private function btn_open_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_open = temp;
			temp.name = "btn_open";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_zhankai;
			temp.visible = false;
			temp.x = 234;
			temp.y = 0;
			return temp;
		}

		private function grpshuaxin_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpshuaxin = temp;
			temp.name = "grpshuaxin";
			temp.x = 21;
			temp.y = 42;
			temp.elementsContent = [lbName2_i(),__Active_LiJinQiangDuo_Label1_i(),lbTime_i()];
			return temp;
		}

		private function grpto_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpto = temp;
			temp.name = "grpto";
			temp.visible = false;
			temp.x = 21;
			temp.y = 50;
			temp.elementsContent = [lbName_i(),lbTo_i(),lbOk_i()];
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
			temp.y = 12;
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
			temp.y = 12;
			return temp;
		}

		private function icon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon = temp;
			temp.name = "icon";
			temp.styleName = "ui/app/activety/zonghe/tianjianglijin/lijin.png";
			temp.x = 27;
			temp.y = 106;
			return temp;
		}

		private function lbHeadName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbHeadName = temp;
			temp.name = "lbHeadName";
			temp.fontSize = 16;
			temp.text = "礼金抢夺";
			temp.textAlign = "center";
			temp.color = 0xFFF2B7;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlue"];
			temp.width = 205;
			temp.x = 27;
			temp.y = 6;
			return temp;
		}

		private function lbName2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName2 = temp;
			temp.name = "lbName2";
			temp.text = "盗宝小怪(4)";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function lbName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName = temp;
			temp.name = "lbName";
			temp.text = "盗宝小怪(4)";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function lbOk_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbOk = temp;
			temp.name = "lbOk";
			temp.text = "已抢夺完毕";
			temp.color = 0xE8C958;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = false;
			temp.width = 79;
			temp.x = 80;
			temp.y = 0;
			return temp;
		}

		private function lbPaiHang_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbPaiHang = temp;
			temp.name = "lbPaiHang";
			temp.text = "礼金排行";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = true;
			temp.width = 70;
			temp.x = 21;
			temp.y = 180;
			return temp;
		}

		private function lbTime_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTime = temp;
			temp.name = "lbTime";
			temp.text = "00:00:53";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = false;
			temp.width = 76;
			temp.x = 72;
			temp.y = 20;
			return temp;
		}

		private function lbTo_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTo = temp;
			temp.name = "lbTo";
			temp.text = "前往";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = true;
			temp.width = 35;
			temp.x = 180;
			temp.y = 0;
			return temp;
		}

		private function numLiJin_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			numLiJin = temp;
			temp.name = "numLiJin";
			temp.gap = -3;
			temp.height = 38;
			temp.label = "15";
			temp.styleClass = org.mokylin.skin.app.activety.number.UINumberNum;
			temp.width = 87;
			temp.x = 136;
			temp.y = 124;
			return temp;
		}

		private function task_box_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			task_box = temp;
			temp.name = "task_box";
			temp.width = 253;
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [ui_bg_i(),__Active_LiJinQiangDuo_UIAsset1_i(),lbHeadName_i(),head_left_i(),head_right_i(),grpto_i(),grpshuaxin_i(),__Active_LiJinQiangDuo_Label2_i(),lbPaiHang_i(),__Active_LiJinQiangDuo_UIAsset2_i(),icon_i(),uiJia_i(),numLiJin_i()];
			return temp;
		}

		private function uiJia_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiJia = temp;
			temp.name = "uiJia";
			temp.styleName = "ui/app/activety/zonghe/tianjianglijin/%2b.png";
			temp.x = 97;
			temp.y = 128;
			return temp;
		}

		private function ui_bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ui_bg = temp;
			temp.name = "ui_bg";
			temp.height = 212;
			temp.styleName = "ui/mainui/renwu/bg.png";
			temp.width = 253;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}