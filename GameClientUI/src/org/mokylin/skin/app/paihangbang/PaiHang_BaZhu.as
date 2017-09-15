package org.mokylin.skin.app.paihangbang
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.paihangbang.PaiHang_Xuwei;
	import org.mokylin.skin.common.TongYongPanelbg1;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class PaiHang_BaZhu extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.SkinnableContainer;

		public var btnPutong:feathers.controls.Button;

		public var btnYuanbao:feathers.controls.Button;

		public var content:feathers.controls.Group;

		public var grpHead:feathers.controls.Group;

		public var headbg:feathers.controls.UIAsset;

		public var lbAdd:feathers.controls.Label;

		public var lbJiacheng:feathers.controls.Label;

		public var lbName:feathers.controls.Label;

		public var lbPutong:feathers.controls.Label;

		public var lbYuanbao:feathers.controls.Label;

		public var skinXuwei:feathers.controls.SkinnableContainer;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function PaiHang_BaZhu()
		{
			super();
			
			this.currentState = "normal";
			this.height = 601;
			this.width = 956;
			this.elementsContent = [bg_i(),__PaiHang_BaZhu_UIAsset1_i(),__PaiHang_BaZhu_UIAsset2_i(),__PaiHang_BaZhu_UIAsset3_i(),__PaiHang_BaZhu_UIAsset4_i(),grpHead_i(),content_i(),btnPutong_i(),btnYuanbao_i(),lbAdd_i(),__PaiHang_BaZhu_UIAsset5_i(),__PaiHang_BaZhu_UIAsset6_i(),__PaiHang_BaZhu_Group1_i(),__PaiHang_BaZhu_Group2_i(),__PaiHang_BaZhu_Label1_i(),__PaiHang_BaZhu_Label2_i(),__PaiHang_BaZhu_Label3_i(),__PaiHang_BaZhu_Label4_i(),lbPutong_i(),__PaiHang_BaZhu_Label5_i(),lbYuanbao_i(),lbJiacheng_i(),skinXuwei_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __PaiHang_BaZhu_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 717;
			temp.y = 109;
			temp.elementsContent = [__PaiHang_BaZhu_UIAsset7_i(),__PaiHang_BaZhu_UIAsset8_i(),__PaiHang_BaZhu_UIAsset9_i()];
			return temp;
		}

		private function __PaiHang_BaZhu_Group2_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 717;
			temp.y = 297;
			temp.elementsContent = [__PaiHang_BaZhu_UIAsset10_i(),__PaiHang_BaZhu_UIAsset11_i(),__PaiHang_BaZhu_UIAsset12_i()];
			return temp;
		}

		private function __PaiHang_BaZhu_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.leading = 4;
			temp.text = "1.膜拜寰宇霸主可以获得大量的经验奖励。";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 209;
			temp.x = 715;
			temp.y = 131;
			return temp;
		}

		private function __PaiHang_BaZhu_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.leading = 4;
			temp.text = "2.元宝膜拜可以为次日元宝膜拜奖励提供加成，膜拜字数越多，次日获得奖励越多。";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 209;
			temp.x = 715;
			temp.y = 172;
			return temp;
		}

		private function __PaiHang_BaZhu_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.htmlText = "3.奖励加成最多可提升至<font color='#00ff33'>100%</font>，中断一次则减少<font color='#00ff33'>10%</font>加成。";
			temp.leading = 4;
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 209;
			temp.x = 715;
			temp.y = 232;
			return temp;
		}

		private function __PaiHang_BaZhu_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "1.普通膜拜：";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 715;
			temp.y = 319;
			return temp;
		}

		private function __PaiHang_BaZhu_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "1.元宝膜拜：";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 715;
			temp.y = 342;
			return temp;
		}

		private function __PaiHang_BaZhu_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/word/mobaijiangli.png";
			temp.x = 70;
			temp.y = 0;
			return temp;
		}

		private function __PaiHang_BaZhu_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/wenshi/huawen_1.png";
			temp.x = 0;
			temp.y = 4;
			return temp;
		}

		private function __PaiHang_BaZhu_UIAsset12_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/wenshi/huawen_2.png";
			temp.x = 132;
			temp.y = 4;
			return temp;
		}

		private function __PaiHang_BaZhu_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 508;
			temp.styleName = "ui/common/background/neikuang_1.png";
			temp.width = 675;
			temp.x = 19;
			temp.y = 84;
			return temp;
		}

		private function __PaiHang_BaZhu_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/app/paihangbang/word/weiwoduzun.png";
			temp.x = 435;
			temp.y = 8;
			return temp;
		}

		private function __PaiHang_BaZhu_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/paihangbang/bg_bazhu1.png";
			temp.x = 24;
			temp.y = 89;
			return temp;
		}

		private function __PaiHang_BaZhu_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/paihangbang/bg_bazhu2.png";
			temp.x = 693;
			temp.y = 84;
			return temp;
		}

		private function __PaiHang_BaZhu_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 155;
			temp.styleName = "ui/app/paihangbang/bgkuang.png";
			temp.width = 233;
			temp.x = 700;
			temp.y = 123;
			return temp;
		}

		private function __PaiHang_BaZhu_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 78;
			temp.styleName = "ui/app/paihangbang/bgkuang.png";
			temp.width = 233;
			temp.x = 700;
			temp.y = 311;
			return temp;
		}

		private function __PaiHang_BaZhu_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/word/guizeshuoming.png";
			temp.x = 70;
			temp.y = 0;
			return temp;
		}

		private function __PaiHang_BaZhu_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/wenshi/huawen_1.png";
			temp.x = 0;
			temp.y = 4;
			return temp;
		}

		private function __PaiHang_BaZhu_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/wenshi/huawen_2.png";
			temp.x = 132;
			temp.y = 4;
			return temp;
		}

		private function bg_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			bg = temp;
			temp.name = "bg";
			temp.height = 601;
			var skin:StateSkin = new org.mokylin.skin.common.TongYongPanelbg1()
			temp.skin = skin
			temp.width = 956;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnPutong_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnPutong = temp;
			temp.name = "btnPutong";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "普通膜拜";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xEAEABC;
			temp.width = 88;
			temp.x = 221;
			temp.y = 521;
			return temp;
		}

		private function btnYuanbao_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnYuanbao = temp;
			temp.name = "btnYuanbao";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "元宝膜拜";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xEAEABC;
			temp.width = 88;
			temp.x = 404;
			temp.y = 521;
			return temp;
		}

		private function content_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			content = temp;
			temp.name = "content";
			temp.height = 400;
			temp.width = 586;
			temp.x = 68;
			temp.y = 119;
			return temp;
		}

		private function grpHead_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpHead = temp;
			temp.name = "grpHead";
			temp.x = 248;
			temp.y = 69;
			temp.elementsContent = [headbg_i(),lbName_i()];
			return temp;
		}

		private function headbg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			headbg = temp;
			temp.name = "headbg";
			temp.styleName = "ui/app/paihangbang/mingzikuang.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function lbAdd_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbAdd = temp;
			temp.name = "lbAdd";
			temp.text = "奖励加成10%";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 103;
			temp.x = 406;
			temp.y = 558;
			return temp;
		}

		private function lbJiacheng_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbJiacheng = temp;
			temp.name = "lbJiacheng";
			temp.text = "（奖励加成 100000）";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 195;
			temp.x = 726;
			temp.y = 360;
			return temp;
		}

		private function lbName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName = temp;
			temp.name = "lbName";
			temp.text = "姓名六个字的";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 165;
			temp.x = 28;
			temp.y = 8;
			return temp;
		}

		private function lbPutong_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbPutong = temp;
			temp.name = "lbPutong";
			temp.text = "300000 经验";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 123;
			temp.x = 802;
			temp.y = 319;
			return temp;
		}

		private function lbYuanbao_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbYuanbao = temp;
			temp.name = "lbYuanbao";
			temp.text = "400000 经验";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 123;
			temp.x = 802;
			temp.y = 342;
			return temp;
		}

		private function skinXuwei_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinXuwei = temp;
			temp.name = "skinXuwei";
			temp.height = 340;
			var skin:StateSkin = new org.mokylin.skin.app.paihangbang.PaiHang_Xuwei()
			temp.skin = skin
			temp.width = 216;
			temp.x = 253;
			temp.y = 158;
			return temp;
		}

	}
}