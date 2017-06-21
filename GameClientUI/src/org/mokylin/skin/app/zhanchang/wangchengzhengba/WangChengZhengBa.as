package org.mokylin.skin.app.zhanchang.wangchengzhengba
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.zhanchang.wangchengzhengba.WangChengHead_Item;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;
	import org.mokylin.skin.component.button.ButtonSkin_shuoming2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class WangChengZhengBa extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnLingQu:feathers.controls.Button;

		public var btnShuoMing:feathers.controls.Button;

		public var dui1:feathers.controls.UIAsset;

		public var dui2:feathers.controls.UIAsset;

		public var dui3:feathers.controls.UIAsset;

		public var dui4:feathers.controls.UIAsset;

		public var dui5:feathers.controls.UIAsset;

		public var gPlayer1:feathers.controls.Group;

		public var gPlayer2:feathers.controls.Group;

		public var gPlayer3:feathers.controls.Group;

		public var gPlayer4:feathers.controls.Group;

		public var gPlayer5:feathers.controls.Group;

		public var grpCheng:feathers.controls.Group;

		public var head1:feathers.controls.SkinnableContainer;

		public var head2:feathers.controls.SkinnableContainer;

		public var head3:feathers.controls.SkinnableContainer;

		public var head4:feathers.controls.SkinnableContainer;

		public var head5:feathers.controls.SkinnableContainer;

		public var icon1:feathers.controls.UIAsset;

		public var icon2:feathers.controls.UIAsset;

		public var icon3:feathers.controls.UIAsset;

		public var icon4:feathers.controls.UIAsset;

		public var lbBangName:feathers.controls.Label;

		public var lbJiangli:feathers.controls.Label;

		public var uiBaoXiang:feathers.controls.UIAsset;

		public var uiLingQu:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function WangChengZhengBa()
		{
			super();
			
			this.currentState = "normal";
			this.height = 587;
			this.width = 947;
			this.elementsContent = [__WangChengZhengBa_UIAsset3_i(),__WangChengZhengBa_UIAsset4_i(),gPlayer1_i(),gPlayer2_i(),gPlayer3_i(),gPlayer4_i(),gPlayer5_i(),grpCheng_i(),__WangChengZhengBa_Label1_i(),lbBangName_i(),__WangChengZhengBa_UIAsset7_i(),icon1_i(),icon2_i(),icon3_i(),icon4_i(),lbJiangli_i(),btnLingQu_i(),btnShuoMing_i(),uiBaoXiang_i(),uiLingQu_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __WangChengZhengBa_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "[占]";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 408;
			temp.y = 482;
			return temp;
		}

		private function __WangChengZhengBa_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/zhanchang/weicheng_bg.jpg";
			temp.x = 20;
			temp.y = 75;
			return temp;
		}

		private function __WangChengZhengBa_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/weicheng/bg2.jpg";
			temp.x = 19;
			temp.y = 507;
			return temp;
		}

		private function __WangChengZhengBa_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/weicheng/wangcheng4.png";
			temp.x = 0;
			temp.y = 33;
			return temp;
		}

		private function __WangChengZhengBa_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/weicheng/wangcheng.png";
			temp.x = 68;
			temp.y = 0;
			return temp;
		}

		private function __WangChengZhengBa_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/weicheng/wodejiangli.png";
			temp.x = 24;
			temp.y = 535;
			return temp;
		}

		private function btnLingQu_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnLingQu = temp;
			temp.name = "btnLingQu";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "进入战场";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xCFC6AE;
			temp.width = 117;
			temp.x = 417;
			temp.y = 530;
			return temp;
		}

		private function btnShuoMing_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnShuoMing = temp;
			temp.name = "btnShuoMing";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_shuoming2;
			temp.x = 898;
			temp.y = 81;
			return temp;
		}

		private function dui1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			dui1 = temp;
			temp.name = "dui1";
			temp.height = 10;
			temp.width = 10;
			temp.x = 50;
			temp.y = 305;
			return temp;
		}

		private function dui2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			dui2 = temp;
			temp.name = "dui2";
			temp.height = 10;
			temp.width = 10;
			temp.x = 79;
			temp.y = 355;
			return temp;
		}

		private function dui3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			dui3 = temp;
			temp.name = "dui3";
			temp.height = 10;
			temp.width = 10;
			temp.x = 65;
			temp.y = 376;
			return temp;
		}

		private function dui4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			dui4 = temp;
			temp.name = "dui4";
			temp.height = 10;
			temp.width = 10;
			temp.x = 84;
			temp.y = 353;
			return temp;
		}

		private function dui5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			dui5 = temp;
			temp.name = "dui5";
			temp.height = 10;
			temp.width = 10;
			temp.x = 64;
			temp.y = 305;
			return temp;
		}

		private function gPlayer1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			gPlayer1 = temp;
			temp.name = "gPlayer1";
			temp.x = 76;
			temp.y = 139;
			temp.elementsContent = [head1_i(),dui1_i()];
			return temp;
		}

		private function gPlayer2_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			gPlayer2 = temp;
			temp.name = "gPlayer2";
			temp.x = 199;
			temp.y = 100;
			temp.elementsContent = [head2_i(),dui2_i()];
			return temp;
		}

		private function gPlayer3_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			gPlayer3 = temp;
			temp.name = "gPlayer3";
			temp.x = 399;
			temp.y = 80;
			temp.elementsContent = [head3_i(),dui3_i()];
			return temp;
		}

		private function gPlayer4_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			gPlayer4 = temp;
			temp.name = "gPlayer4";
			temp.x = 583;
			temp.y = 100;
			temp.elementsContent = [head4_i(),dui4_i()];
			return temp;
		}

		private function gPlayer5_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			gPlayer5 = temp;
			temp.name = "gPlayer5";
			temp.x = 766;
			temp.y = 139;
			temp.elementsContent = [head5_i(),dui5_i()];
			return temp;
		}

		private function grpCheng_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpCheng = temp;
			temp.name = "grpCheng";
			temp.x = 398;
			temp.y = 350;
			temp.elementsContent = [__WangChengZhengBa_UIAsset5_i(),__WangChengZhengBa_UIAsset6_i()];
			return temp;
		}

		private function head1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			head1 = temp;
			temp.name = "head1";
			temp.height = 51;
			var skin:StateSkin = new org.mokylin.skin.app.zhanchang.wangchengzhengba.WangChengHead_Item()
			temp.skin = skin
			temp.width = 143;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function head2_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			head2 = temp;
			temp.name = "head2";
			temp.height = 51;
			var skin:StateSkin = new org.mokylin.skin.app.zhanchang.wangchengzhengba.WangChengHead_Item()
			temp.skin = skin
			temp.width = 143;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function head3_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			head3 = temp;
			temp.name = "head3";
			temp.height = 51;
			var skin:StateSkin = new org.mokylin.skin.app.zhanchang.wangchengzhengba.WangChengHead_Item()
			temp.skin = skin
			temp.width = 143;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function head4_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			head4 = temp;
			temp.name = "head4";
			temp.height = 51;
			var skin:StateSkin = new org.mokylin.skin.app.zhanchang.wangchengzhengba.WangChengHead_Item()
			temp.skin = skin
			temp.width = 143;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function head5_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			head5 = temp;
			temp.name = "head5";
			temp.height = 51;
			var skin:StateSkin = new org.mokylin.skin.app.zhanchang.wangchengzhengba.WangChengHead_Item()
			temp.skin = skin
			temp.width = 143;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function icon1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon1 = temp;
			temp.name = "icon1";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 93;
			temp.y = 513;
			return temp;
		}

		private function icon2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon2 = temp;
			temp.name = "icon2";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 148;
			temp.y = 513;
			return temp;
		}

		private function icon3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon3 = temp;
			temp.name = "icon3";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 203;
			temp.y = 513;
			return temp;
		}

		private function icon4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon4 = temp;
			temp.name = "icon4";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 258;
			temp.y = 513;
			return temp;
		}

		private function lbBangName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbBangName = temp;
			temp.name = "lbBangName";
			temp.text = "帮派名称七个字";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 436;
			temp.y = 482;
			return temp;
		}

		private function lbJiangli_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbJiangli = temp;
			temp.name = "lbJiangli";
			temp.text = "奖励一览";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = true;
			temp.x = 319;
			temp.y = 537;
			return temp;
		}

		private function uiBaoXiang_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiBaoXiang = temp;
			temp.name = "uiBaoXiang";
			temp.styleName = "ui/app/zhanchang/weicheng/baoxiang.png";
			temp.x = 498;
			temp.y = 382;
			return temp;
		}

		private function uiLingQu_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiLingQu = temp;
			temp.name = "uiLingQu";
			temp.styleName = "ui/app/zhanchang/weicheng/jinrifuliyilingqu.png";
			temp.x = 420;
			temp.y = 376;
			return temp;
		}

	}
}