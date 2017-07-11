package org.mokylin.skin.app.hongbao
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Check;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.app.hongbao.button.ButtonCha;
	import org.mokylin.skin.app.hongbao.button.ButtonChai;
	import org.mokylin.skin.app.hongbao.button.ButtonGuanbi;
	import org.mokylin.skin.app.hongbao.button.ButtonJuxulingqu;
	import org.mokylin.skin.app.hongbao.number.UINumberHongbaoNum;
	import org.mokylin.skin.common.Flip1_Skin;
	import org.mokylin.skin.component.check.CheckBoxSkin_1;
	
	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class HongBao_Chai extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnChai:feathers.controls.Button;
		
		public var btnClose:feathers.controls.Button;
		
		public var btnContinue:feathers.controls.Button;
		
		public var btnEixt:feathers.controls.Button;
		
		public var cboxTip:feathers.controls.Check;
		
		public var faBg:feathers.controls.UIAsset;
		
		public var grpChai:feathers.controls.Group;
		
		public var grpFa:feathers.controls.Group;
		
		public var grpMsg:feathers.controls.Group;
		
		public var grpYiJian:feathers.controls.Group;
		
		public var itemgroup:feathers.controls.Group;
		
		public var lbInfo:feathers.controls.Label;
		
		public var lbItem:feathers.controls.Label;
		
		public var lbName:feathers.controls.Label;
		
		public var lbVip:feathers.controls.Label;
		
		public var numL:feathers.controls.UINumber;
		
		public var skinFlip:feathers.controls.SkinnableContainer;
		
		public var uiDown:feathers.controls.UIAsset;
		
		public var uiIcon:feathers.controls.UIAsset;
		
		public var uiLijing:feathers.controls.UIAsset;
		
		public var uiUp:feathers.controls.UIAsset;
		
		
		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function HongBao_Chai()
		{
			super();
			
			this.currentState = "normal";
			this.height = 502;
			this.width = 271;
			this.elementsContent = [__HongBao_Chai_UIAsset1_i(),uiLijing_i(),numL_i(),skinFlip_i(),btnEixt_i(),btnContinue_i(),itemgroup_i(),uiDown_i(),uiUp_i(),__HongBao_Chai_UIAsset2_i(),lbName_i(),grpChai_i(),uiIcon_i(),btnClose_i()];
			
			states = {
			};
			skinNames={};
		}
		
		
		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __HongBao_Chai_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "只有角色在线的情况下才能收到红包";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 5;
			temp.y = 7;
			return temp;
		}
		
		private function __HongBao_Chai_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/hongbao/bg.jpg";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}
		
		private function __HongBao_Chai_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/hongbao/gaoguang.png";
			temp.x = 2;
			temp.y = 0;
			return temp;
		}
		
		private function __HongBao_Chai_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/hongbao/dibanhuitiao.png";
			temp.width = 235;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}
		
		private function btnChai_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnChai = temp;
			temp.name = "btnChai";
			temp.styleClass = org.mokylin.skin.app.hongbao.button.ButtonChai;
			temp.x = 68;
			temp.y = 174;
			return temp;
		}
		
		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.app.hongbao.button.ButtonCha;
			temp.x = 237;
			temp.y = 5;
			return temp;
		}
		
		private function btnContinue_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnContinue = temp;
			temp.name = "btnContinue";
			temp.height = 34;
			temp.styleClass = org.mokylin.skin.app.hongbao.button.ButtonJuxulingqu;
			temp.width = 124;
			temp.x = 75;
			temp.y = 463;
			return temp;
		}
		
		private function btnEixt_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnEixt = temp;
			temp.name = "btnEixt";
			temp.height = 34;
			temp.styleClass = org.mokylin.skin.app.hongbao.button.ButtonGuanbi;
			temp.width = 124;
			temp.x = 75;
			temp.y = 463;
			return temp;
		}
		
		private function cboxTip_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			cboxTip = temp;
			temp.name = "cboxTip";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.labelOffsetY = 3;
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.color = 0x00FF33;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}
		
		private function faBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			faBg = temp;
			temp.name = "faBg";
			temp.styleName = "ui/app/hongbao/dibanhuitiao.png";
			temp.width = 235;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}
		
		private function grpChai_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpChai = temp;
			temp.name = "grpChai";
			temp.x = 12;
			temp.y = 57;
			temp.elementsContent = [btnChai_i(),grpMsg_i(),grpFa_i(),grpYiJian_i(),lbVip_i()];
			return temp;
		}
		
		private function grpFa_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpFa = temp;
			temp.name = "grpFa";
			temp.x = 6;
			temp.y = 99;
			temp.elementsContent = [faBg_i(),lbItem_i()];
			return temp;
		}
		
		private function grpMsg_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpMsg = temp;
			temp.name = "grpMsg";
			temp.x = 6;
			temp.y = 333;
			temp.elementsContent = [__HongBao_Chai_UIAsset3_i(),__HongBao_Chai_Label1_i()];
			return temp;
		}
		
		private function grpYiJian_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpYiJian = temp;
			temp.name = "grpYiJian";
			temp.x = 56;
			temp.y = 382;
			temp.elementsContent = [cboxTip_i(),lbInfo_i()];
			return temp;
		}
		
		private function itemgroup_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			itemgroup = temp;
			temp.name = "itemgroup";
			temp.height = 248;
			temp.width = 260;
			temp.x = 5;
			temp.y = 216;
			return temp;
		}
		
		private function lbInfo_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbInfo = temp;
			temp.name = "lbInfo";
			temp.text = "一键拆取所有红包";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 138;
			temp.x = 27;
			temp.y = 2;
			return temp;
		}
		
		private function lbItem_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbItem = temp;
			temp.name = "lbItem";
			temp.text = "发了一个图标";
			temp.textAlign = "center";
			temp.color = 0xFF0D0D;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 225;
			temp.x = 6;
			temp.y = 7;
			return temp;
		}
		
		private function lbName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName = temp;
			temp.name = "lbName";
			temp.fontSize = 16;
			temp.text = "项少龙红包";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 271;
			temp.x = 0;
			temp.y = 15;
			return temp;
		}
		
		private function lbVip_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbVip = temp;
			temp.name = "lbVip";
			temp.text = "提升VIP";
			temp.textAlign = "center";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.underline = true;
			temp.width = 141;
			temp.x = 55;
			temp.y = 384;
			return temp;
		}
		
		private function numL_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			numL = temp;
			temp.name = "numL";
			temp.gap = -2;
			temp.height = 51;
			temp.label = "9999";
			temp.styleClass = org.mokylin.skin.app.hongbao.number.UINumberHongbaoNum;
			temp.width = 125;
			temp.x = 17;
			temp.y = 152;
			return temp;
		}
		
		private function skinFlip_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinFlip = temp;
			temp.name = "skinFlip";
			temp.height = 26;
			var skin:StateSkin = new org.mokylin.skin.common.Flip1_Skin()
			temp.skin = skin
			temp.width = 122;
			temp.x = 75;
			temp.y = 433;
			return temp;
		}
		
		private function uiDown_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiDown = temp;
			temp.name = "uiDown";
			temp.styleName = "ui/app/hongbao/xia.png";
			temp.x = 2;
			temp.y = 227;
			return temp;
		}
		
		private function uiIcon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiIcon = temp;
			temp.name = "uiIcon";
			temp.styleName = "ui/app/hongbao/touxiangkuang.png";
			temp.x = 98;
			temp.y = 60;
			return temp;
		}
		
		private function uiLijing_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiLijing = temp;
			temp.name = "uiLijing";
			temp.styleName = "ui/app/hongbao/lijin.png";
			temp.x = 139;
			temp.y = 148;
			return temp;
		}
		
		private function uiUp_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiUp = temp;
			temp.name = "uiUp";
			temp.styleName = "ui/app/hongbao/shang.png";
			temp.width = 268;
			temp.x = 2;
			temp.y = 0;
			return temp;
		}
		
	}
}