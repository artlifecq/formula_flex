package org.mokylin.skin.app.zhanchang.jingjichang
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.app.zhanchang.ZhangCheng_Scene;
	import org.mokylin.skin.app.zhanchang.button.ButtonFanhui;
	import org.mokylin.skin.app.zhanchang.button.ButtonJiangli;
	import org.mokylin.skin.app.zhanchang.button.ButtonTiaozhan;
	import org.mokylin.skin.app.zhanchang.jingjichang.JingJiPaiMing;
	import org.mokylin.skin.app.zhanchang.jingjichang.JingJi_Info;
	import org.mokylin.skin.app.zhanchang.jingjichang.RoleItem;
	import org.mokylin.skin.app.zhanchang.jingjichang.RoleItem2;
	import org.mokylin.skin.app.zhanchang.uinumber.UINumberNumber;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class JingJiChan1_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnBack:feathers.controls.Button;

		public var btnJiangli:feathers.controls.Button;

		public var btnTiaoZhan:feathers.controls.Button;

		public var gNormal:feathers.controls.Group;

		public var gTop:feathers.controls.Group;

		public var item_msg:feathers.controls.SkinnableContainer;

		public var lbTime:feathers.controls.Label;

		public var lbTime0:feathers.controls.Label;

		public var numZhanli:feathers.controls.UINumber;

		public var skinBattke:feathers.controls.SkinnableContainer;

		public var skinInfo:feathers.controls.SkinnableContainer;

		public var skinRole1:feathers.controls.SkinnableContainer;

		public var skinRole2:feathers.controls.SkinnableContainer;

		public var skinRole3:feathers.controls.SkinnableContainer;

		public var skinRole4:feathers.controls.SkinnableContainer;

		public var skinRole5:feathers.controls.SkinnableContainer;

		public var top1:feathers.controls.SkinnableContainer;

		public var top2:feathers.controls.SkinnableContainer;

		public var top3:feathers.controls.SkinnableContainer;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function JingJiChan1_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__JingJiChan1_Skin_UIAsset2_i(),gNormal_i(),gTop_i(),skinInfo_i(),lbTime_i(),__JingJiChan1_Skin_Label1_i(),numZhanli_i(),btnTiaoZhan_i(),btnBack_i(),btnJiangli_i(),item_msg_i(),skinBattke_i(),lbTime0_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __JingJiChan1_Skin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "我的排名：";
			temp.color = 0xBEA757;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 710;
			temp.y = 548;
			return temp;
		}

		private function __JingJiChan1_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/zhanchang/bg.jpg";
			temp.x = 18;
			temp.y = 74;
			return temp;
		}

		private function btnBack_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnBack = temp;
			temp.name = "btnBack";
			temp.styleClass = org.mokylin.skin.app.zhanchang.button.ButtonFanhui;
			temp.x = 350;
			temp.y = 74;
			return temp;
		}

		private function btnJiangli_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnJiangli = temp;
			temp.name = "btnJiangli";
			temp.styleClass = org.mokylin.skin.app.zhanchang.button.ButtonJiangli;
			temp.x = 350;
			temp.y = 512;
			return temp;
		}

		private function btnTiaoZhan_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnTiaoZhan = temp;
			temp.name = "btnTiaoZhan";
			temp.styleClass = org.mokylin.skin.app.zhanchang.button.ButtonTiaozhan;
			temp.x = 350;
			temp.y = 74;
			return temp;
		}

		private function gNormal_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			gNormal = temp;
			temp.name = "gNormal";
			temp.x = 23;
			temp.y = 107;
			temp.elementsContent = [skinRole3_i(),skinRole2_i(),skinRole1_i(),skinRole4_i(),skinRole5_i()];
			return temp;
		}

		private function gTop_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			gTop = temp;
			temp.name = "gTop";
			temp.x = 121;
			temp.y = 109;
			temp.elementsContent = [top3_i(),top2_i(),top1_i()];
			return temp;
		}

		private function item_msg_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			item_msg = temp;
			temp.name = "item_msg";
			temp.height = 24;
			var skin:StateSkin = new org.mokylin.skin.app.zhanchang.jingjichang.JingJiPaiMing()
			temp.skin = skin
			temp.width = 276;
			temp.x = 653;
			temp.y = 75;
			return temp;
		}

		private function lbTime0_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTime0 = temp;
			temp.name = "lbTime0";
			temp.text = "每日24点";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 117;
			temp.x = 199;
			temp.y = 548;
			return temp;
		}

		private function lbTime_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTime = temp;
			temp.name = "lbTime";
			temp.text = "挑战刷新时间：";
			temp.color = 0xBEA757;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 117;
			temp.x = 100;
			temp.y = 548;
			return temp;
		}

		private function numZhanli_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			numZhanli = temp;
			temp.name = "numZhanli";
			temp.gap = -3;
			temp.height = 25;
			temp.label = "1168";
			temp.styleClass = org.mokylin.skin.app.zhanchang.uinumber.UINumberNumber;
			temp.width = 122;
			temp.x = 777;
			temp.y = 542;
			return temp;
		}

		private function skinBattke_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinBattke = temp;
			temp.name = "skinBattke";
			temp.height = 512;
			var skin:StateSkin = new org.mokylin.skin.app.zhanchang.ZhangCheng_Scene()
			temp.skin = skin
			temp.visible = false;
			temp.width = 922;
			temp.x = 14;
			temp.y = 69;
			return temp;
		}

		private function skinInfo_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinInfo = temp;
			temp.name = "skinInfo";
			temp.height = 106;
			var skin:StateSkin = new org.mokylin.skin.app.zhanchang.jingjichang.JingJi_Info()
			temp.skin = skin
			temp.width = 225;
			temp.x = 19;
			temp.y = 74;
			return temp;
		}

		private function skinRole1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinRole1 = temp;
			temp.name = "skinRole1";
			temp.height = 329;
			var skin:StateSkin = new org.mokylin.skin.app.zhanchang.jingjichang.RoleItem()
			temp.skin = skin
			temp.width = 173;
			temp.x = 0;
			temp.y = 20;
			return temp;
		}

		private function skinRole2_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinRole2 = temp;
			temp.name = "skinRole2";
			temp.height = 329;
			var skin:StateSkin = new org.mokylin.skin.app.zhanchang.jingjichang.RoleItem()
			temp.skin = skin
			temp.width = 173;
			temp.x = 183;
			temp.y = 9;
			return temp;
		}

		private function skinRole3_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinRole3 = temp;
			temp.name = "skinRole3";
			temp.height = 329;
			var skin:StateSkin = new org.mokylin.skin.app.zhanchang.jingjichang.RoleItem()
			temp.skin = skin
			temp.width = 173;
			temp.x = 368;
			temp.y = 0;
			return temp;
		}

		private function skinRole4_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinRole4 = temp;
			temp.name = "skinRole4";
			temp.height = 329;
			var skin:StateSkin = new org.mokylin.skin.app.zhanchang.jingjichang.RoleItem()
			temp.skin = skin
			temp.width = 173;
			temp.x = 550;
			temp.y = 10;
			return temp;
		}

		private function skinRole5_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinRole5 = temp;
			temp.name = "skinRole5";
			temp.height = 329;
			var skin:StateSkin = new org.mokylin.skin.app.zhanchang.jingjichang.RoleItem()
			temp.skin = skin
			temp.width = 173;
			temp.x = 731;
			temp.y = 20;
			return temp;
		}

		private function top1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			top1 = temp;
			temp.name = "top1";
			temp.height = 416;
			var skin:StateSkin = new org.mokylin.skin.app.zhanchang.jingjichang.RoleItem2()
			temp.skin = skin
			temp.width = 187;
			temp.x = 0;
			temp.y = 5;
			return temp;
		}

		private function top2_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			top2 = temp;
			temp.name = "top2";
			temp.height = 416;
			var skin:StateSkin = new org.mokylin.skin.app.zhanchang.jingjichang.RoleItem2()
			temp.skin = skin
			temp.width = 187;
			temp.x = 530;
			temp.y = 5;
			return temp;
		}

		private function top3_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			top3 = temp;
			temp.name = "top3";
			temp.height = 416;
			var skin:StateSkin = new org.mokylin.skin.app.zhanchang.jingjichang.RoleItem2()
			temp.skin = skin
			temp.width = 187;
			temp.x = 260;
			temp.y = -15;
			return temp;
		}

	}
}