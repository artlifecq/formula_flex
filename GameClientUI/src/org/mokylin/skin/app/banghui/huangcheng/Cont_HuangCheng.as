package org.mokylin.skin.app.banghui.huangcheng
{
	import feathers.controls.Group;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.banghui.wangcheng.WangChengInfo_Item;
	import org.mokylin.skin.app.banghui.wangcheng.WangCheng_BaoXiang;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Cont_HuangCheng extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var grpCheng1:feathers.controls.Group;

		public var grpCheng2:feathers.controls.Group;

		public var grpCheng3:feathers.controls.Group;

		public var grpCheng4:feathers.controls.Group;

		public var grpWangCheng:feathers.controls.Group;

		public var skinBaoXiang:feathers.controls.SkinnableContainer;

		public var skinName:feathers.controls.SkinnableContainer;

		public var skinName1:feathers.controls.SkinnableContainer;

		public var skinName2:feathers.controls.SkinnableContainer;

		public var skinName3:feathers.controls.SkinnableContainer;

		public var skinName4:feathers.controls.SkinnableContainer;

		public var uiCh1:feathers.controls.UIAsset;

		public var uiCh2:feathers.controls.UIAsset;

		public var uiCh3:feathers.controls.UIAsset;

		public var uiCh4:feathers.controls.UIAsset;

		public var uiFlag:feathers.controls.UIAsset;

		public var uiFlag1:feathers.controls.UIAsset;

		public var uiFlag2:feathers.controls.UIAsset;

		public var uiFlag3:feathers.controls.UIAsset;

		public var uiFlag4:feathers.controls.UIAsset;

		public var uiWangCheng:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Cont_HuangCheng()
		{
			super();
			
			this.currentState = "normal";
			this.height = 455;
			this.width = 634;
			this.elementsContent = [__Cont_HuangCheng_UIAsset1_i(),grpWangCheng_i(),grpCheng1_i(),grpCheng2_i(),grpCheng3_i(),grpCheng4_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Cont_HuangCheng_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/banghui/hc_bg.jpg";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function grpCheng1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpCheng1 = temp;
			temp.name = "grpCheng1";
			temp.height = 190;
			temp.x = 88;
			temp.y = 152;
			temp.elementsContent = [uiCh1_i(),uiFlag1_i(),skinName1_i()];
			return temp;
		}

		private function grpCheng2_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpCheng2 = temp;
			temp.name = "grpCheng2";
			temp.height = 189;
			temp.x = 201;
			temp.y = 27;
			temp.elementsContent = [uiCh2_i(),uiFlag2_i(),skinName2_i()];
			return temp;
		}

		private function grpCheng3_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpCheng3 = temp;
			temp.name = "grpCheng3";
			temp.height = 188;
			temp.x = 338;
			temp.y = 5;
			temp.elementsContent = [uiCh3_i(),uiFlag3_i(),skinName3_i()];
			return temp;
		}

		private function grpCheng4_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpCheng4 = temp;
			temp.name = "grpCheng4";
			temp.height = 188;
			temp.x = 320;
			temp.y = 245;
			temp.elementsContent = [uiCh4_i(),uiFlag4_i(),skinName4_i()];
			return temp;
		}

		private function grpWangCheng_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpWangCheng = temp;
			temp.name = "grpWangCheng";
			temp.height = 214;
			temp.x = 278;
			temp.y = 140;
			temp.elementsContent = [uiWangCheng_i(),uiFlag_i(),skinBaoXiang_i(),skinName_i()];
			return temp;
		}

		private function skinBaoXiang_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinBaoXiang = temp;
			temp.name = "skinBaoXiang";
			temp.height = 59;
			var skin:StateSkin = new org.mokylin.skin.app.banghui.wangcheng.WangCheng_BaoXiang()
			temp.skin = skin
			temp.width = 154;
			temp.x = 15;
			temp.y = 27;
			return temp;
		}

		private function skinName1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinName1 = temp;
			temp.name = "skinName1";
			temp.height = 24;
			var skin:StateSkin = new org.mokylin.skin.app.banghui.wangcheng.WangChengInfo_Item()
			temp.skin = skin
			temp.width = 187;
			temp.x = 0;
			temp.y = 21;
			return temp;
		}

		private function skinName2_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinName2 = temp;
			temp.name = "skinName2";
			temp.height = 24;
			var skin:StateSkin = new org.mokylin.skin.app.banghui.wangcheng.WangChengInfo_Item()
			temp.skin = skin
			temp.width = 187;
			temp.x = -26;
			temp.y = 21;
			return temp;
		}

		private function skinName3_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinName3 = temp;
			temp.name = "skinName3";
			temp.height = 24;
			var skin:StateSkin = new org.mokylin.skin.app.banghui.wangcheng.WangChengInfo_Item()
			temp.skin = skin
			temp.width = 187;
			temp.x = -1;
			temp.y = 21;
			return temp;
		}

		private function skinName4_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinName4 = temp;
			temp.name = "skinName4";
			temp.height = 24;
			var skin:StateSkin = new org.mokylin.skin.app.banghui.wangcheng.WangChengInfo_Item()
			temp.skin = skin
			temp.width = 187;
			temp.x = -8;
			temp.y = 137;
			return temp;
		}

		private function skinName_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinName = temp;
			temp.name = "skinName";
			temp.height = 24;
			var skin:StateSkin = new org.mokylin.skin.app.banghui.wangcheng.WangChengInfo_Item()
			temp.skin = skin
			temp.width = 187;
			temp.x = 128;
			temp.y = 65;
			return temp;
		}

		private function uiCh1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiCh1 = temp;
			temp.name = "uiCh1";
			temp.styleName = "ui/app/banghui/wangcheng/wangcheng3.png";
			temp.x = 20;
			temp.y = 42;
			return temp;
		}

		private function uiCh2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiCh2 = temp;
			temp.name = "uiCh2";
			temp.styleName = "ui/app/banghui/wangcheng/wangcheng2.png";
			temp.x = 17;
			temp.y = 42;
			return temp;
		}

		private function uiCh3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiCh3 = temp;
			temp.name = "uiCh3";
			temp.styleName = "ui/app/banghui/wangcheng/wangcheng1.png";
			temp.x = 24;
			temp.y = 43;
			return temp;
		}

		private function uiCh4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiCh4 = temp;
			temp.name = "uiCh4";
			temp.styleName = "ui/app/banghui/wangcheng/wangcheng4.png";
			temp.x = 24;
			temp.y = 43;
			return temp;
		}

		private function uiFlag1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiFlag1 = temp;
			temp.name = "uiFlag1";
			temp.styleName = "ui/app/banghui/wangcheng/daliang.png";
			temp.x = 41;
			temp.y = 106;
			return temp;
		}

		private function uiFlag2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiFlag2 = temp;
			temp.name = "uiFlag2";
			temp.styleName = "ui/app/banghui/wangcheng/handan.png";
			temp.x = 48;
			temp.y = 114;
			return temp;
		}

		private function uiFlag3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiFlag3 = temp;
			temp.name = "uiFlag3";
			temp.styleName = "ui/app/banghui/wangcheng/linzi.png";
			temp.x = 59;
			temp.y = 113;
			return temp;
		}

		private function uiFlag4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiFlag4 = temp;
			temp.name = "uiFlag4";
			temp.styleName = "ui/app/banghui/wangcheng/chengdu.png";
			temp.x = 62;
			temp.y = 114;
			return temp;
		}

		private function uiFlag_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiFlag = temp;
			temp.name = "uiFlag";
			temp.styleName = "ui/app/banghui/wangcheng/xianyang.png";
			temp.x = 31;
			temp.y = 104;
			return temp;
		}

		private function uiWangCheng_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiWangCheng = temp;
			temp.name = "uiWangCheng";
			temp.styleName = "ui/app/banghui/huangcheng/huangchengda.png";
			temp.x = 8;
			temp.y = 30;
			return temp;
		}

	}
}