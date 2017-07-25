package org.mokylin.skin.app.zhanchang.wangchengzhengba
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.banghui.wangcheng.XuWeiSkin;
	import org.mokylin.skin.app.zhanchang.wangchengzhengba.WangChengHead_Item;
	import org.mokylin.skin.component.button.ButtonSkin_info;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;

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
		public var btnShuoMing:feathers.controls.Button;

		public var gPlayer1:feathers.controls.Group;

		public var gPlayer2:feathers.controls.Group;

		public var gPlayer3:feathers.controls.Group;

		public var gPlayer4:feathers.controls.Group;

		public var gPlayer5:feathers.controls.Group;

		public var grpCheng0:feathers.controls.Group;

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

		public var lbZhan:feathers.controls.Label;

		public var playerGrp1:feathers.controls.Group;

		public var playerGrp2:feathers.controls.Group;

		public var playerGrp3:feathers.controls.Group;

		public var playerGrp4:feathers.controls.Group;

		public var playerGrp5:feathers.controls.Group;

		public var toZhanChang:feathers.controls.Button;

		public var uiBaoXiang:feathers.controls.UIAsset;

		public var uiLingQu:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function WangChengZhengBa()
		{
			super();
			
			this.currentState = "normal";
			this.height = 601;
			this.width = 956;
			this.elementsContent = [__WangChengZhengBa_UIAsset2_i(),__WangChengZhengBa_UIAsset3_i(),__WangChengZhengBa_SkinnableContainer1_i(),gPlayer1_i(),gPlayer2_i(),gPlayer3_i(),gPlayer4_i(),gPlayer5_i(),grpCheng0_i(),uiBaoXiang_i(),uiLingQu_i(),lbZhan_i(),lbBangName_i(),__WangChengZhengBa_UIAsset6_i(),icon1_i(),icon2_i(),icon3_i(),icon4_i(),lbJiangli_i(),toZhanChang_i(),btnShuoMing_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __WangChengZhengBa_SkinnableContainer1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			temp.height = 340;
			var skin:StateSkin = new org.mokylin.skin.app.banghui.wangcheng.XuWeiSkin()
			temp.skin = skin
			temp.width = 216;
			temp.x = 372;
			temp.y = 141;
			return temp;
		}

		private function __WangChengZhengBa_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/zhanchang/weicheng_bg.jpg";
			temp.x = 24;
			temp.y = 88;
			return temp;
		}

		private function __WangChengZhengBa_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/weicheng/bg2.jpg";
			temp.x = 23;
			temp.y = 520;
			return temp;
		}

		private function __WangChengZhengBa_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/weicheng/wangcheng4.png";
			temp.x = 13;
			temp.y = 34;
			return temp;
		}

		private function __WangChengZhengBa_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/weicheng/wodejiangli.png";
			temp.x = 28;
			temp.y = 548;
			return temp;
		}

		private function btnShuoMing_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnShuoMing = temp;
			temp.name = "btnShuoMing";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_info;
			temp.x = 902;
			temp.y = 94;
			return temp;
		}

		private function gPlayer1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			gPlayer1 = temp;
			temp.name = "gPlayer1";
			temp.x = 64;
			temp.y = 152;
			temp.elementsContent = [head1_i(),playerGrp1_i()];
			return temp;
		}

		private function gPlayer2_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			gPlayer2 = temp;
			temp.name = "gPlayer2";
			temp.x = 212;
			temp.y = 113;
			temp.elementsContent = [head2_i(),playerGrp2_i()];
			return temp;
		}

		private function gPlayer3_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			gPlayer3 = temp;
			temp.name = "gPlayer3";
			temp.x = 403;
			temp.y = 93;
			temp.elementsContent = [head3_i(),playerGrp3_i()];
			return temp;
		}

		private function gPlayer4_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			gPlayer4 = temp;
			temp.name = "gPlayer4";
			temp.x = 597;
			temp.y = 113;
			temp.elementsContent = [head4_i(),playerGrp4_i()];
			return temp;
		}

		private function gPlayer5_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			gPlayer5 = temp;
			temp.name = "gPlayer5";
			temp.x = 769;
			temp.y = 152;
			temp.elementsContent = [head5_i(),playerGrp5_i()];
			return temp;
		}

		private function grpCheng0_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpCheng0 = temp;
			temp.name = "grpCheng0";
			temp.x = 402;
			temp.y = 363;
			temp.elementsContent = [__WangChengZhengBa_UIAsset4_i()];
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
			temp.x = 97;
			temp.y = 526;
			return temp;
		}

		private function icon2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon2 = temp;
			temp.name = "icon2";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 152;
			temp.y = 526;
			return temp;
		}

		private function icon3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon3 = temp;
			temp.name = "icon3";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 207;
			temp.y = 526;
			return temp;
		}

		private function icon4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon4 = temp;
			temp.name = "icon4";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 262;
			temp.y = 526;
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
			temp.x = 440;
			temp.y = 495;
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
			temp.x = 323;
			temp.y = 550;
			return temp;
		}

		private function lbZhan_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbZhan = temp;
			temp.name = "lbZhan";
			temp.text = "[占]";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 412;
			temp.y = 495;
			return temp;
		}

		private function playerGrp1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			playerGrp1 = temp;
			temp.name = "playerGrp1";
			temp.height = 262;
			temp.width = 137;
			temp.x = 5;
			temp.y = 56;
			return temp;
		}

		private function playerGrp2_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			playerGrp2 = temp;
			temp.name = "playerGrp2";
			temp.height = 301;
			temp.width = 137;
			temp.x = 5;
			temp.y = 64;
			return temp;
		}

		private function playerGrp3_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			playerGrp3 = temp;
			temp.name = "playerGrp3";
			temp.height = 321;
			temp.width = 137;
			temp.x = 5;
			temp.y = 64;
			return temp;
		}

		private function playerGrp4_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			playerGrp4 = temp;
			temp.name = "playerGrp4";
			temp.height = 302;
			temp.width = 137;
			temp.x = 4;
			temp.y = 64;
			return temp;
		}

		private function playerGrp5_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			playerGrp5 = temp;
			temp.name = "playerGrp5";
			temp.height = 265;
			temp.width = 137;
			temp.x = 4;
			temp.y = 51;
			return temp;
		}

		private function toZhanChang_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			toZhanChang = temp;
			temp.name = "toZhanChang";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "进入战场";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xFFFFFF;
			temp.width = 110;
			temp.x = 421;
			temp.y = 543;
			return temp;
		}

		private function uiBaoXiang_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiBaoXiang = temp;
			temp.name = "uiBaoXiang";
			temp.styleName = "ui/app/zhanchang/weicheng/baoxiang.png";
			temp.x = 502;
			temp.y = 395;
			return temp;
		}

		private function uiLingQu_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiLingQu = temp;
			temp.name = "uiLingQu";
			temp.styleName = "ui/app/zhanchang/weicheng/jinrifuliyilingqu.png";
			temp.x = 424;
			temp.y = 389;
			return temp;
		}

	}
}