package org.mokylin.skin.app.banghui.wangcheng
{
	import feathers.controls.Group;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.banghui.wangcheng.WangCheng_BaoXiang;
	import org.mokylin.skin.app.banghui.wangcheng.ZhengBaVsNameItemSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Cont_WangCheng extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var grpCheng1:feathers.controls.Group;

		public var grpCheng2:feathers.controls.Group;

		public var grpCheng3:feathers.controls.Group;

		public var grpWangCheng:feathers.controls.Group;

		public var skinBaoXiang0:feathers.controls.SkinnableContainer;

		public var skinBaoXiang1:feathers.controls.SkinnableContainer;

		public var skinBaoXiang2:feathers.controls.SkinnableContainer;

		public var skinBaoXiang3:feathers.controls.SkinnableContainer;

		public var skinName:feathers.controls.SkinnableContainer;

		public var skinName1:feathers.controls.SkinnableContainer;

		public var skinName2:feathers.controls.SkinnableContainer;

		public var skinName3:feathers.controls.SkinnableContainer;

		public var uiCh1:feathers.controls.UIAsset;

		public var uiCh2:feathers.controls.UIAsset;

		public var uiCh3:feathers.controls.UIAsset;

		public var uiFlag:feathers.controls.UIAsset;

		public var uiFlag1:feathers.controls.UIAsset;

		public var uiFlag2:feathers.controls.UIAsset;

		public var uiFlag3:feathers.controls.UIAsset;

		public var uiWangCheng:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Cont_WangCheng()
		{
			super();
			
			this.currentState = "normal";
			this.height = 455;
			this.width = 634;
			this.elementsContent = [__Cont_WangCheng_UIAsset1_i(),grpWangCheng_i(),grpCheng1_i(),grpCheng2_i(),grpCheng3_i(),skinBaoXiang3_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Cont_WangCheng_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/banghui/wczb_bg.jpg";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function grpCheng1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpCheng1 = temp;
			temp.name = "grpCheng1";
			temp.height = 160;
			temp.x = 6;
			temp.y = 159;
			temp.elementsContent = [uiCh1_i(),uiFlag1_i(),skinName1_i(),skinBaoXiang1_i()];
			return temp;
		}

		private function grpCheng2_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpCheng2 = temp;
			temp.name = "grpCheng2";
			temp.height = 160;
			temp.x = 389;
			temp.y = 294;
			temp.elementsContent = [uiCh2_i(),uiFlag2_i(),skinName2_i(),skinBaoXiang2_i()];
			return temp;
		}

		private function grpCheng3_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpCheng3 = temp;
			temp.name = "grpCheng3";
			temp.height = 161;
			temp.x = 358;
			temp.y = 49;
			temp.elementsContent = [uiCh3_i(),uiFlag3_i(),skinName3_i()];
			return temp;
		}

		private function grpWangCheng_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpWangCheng = temp;
			temp.name = "grpWangCheng";
			temp.height = 180;
			temp.x = 258;
			temp.y = 153;
			temp.elementsContent = [uiWangCheng_i(),uiFlag_i(),skinName_i(),skinBaoXiang0_i()];
			return temp;
		}

		private function skinBaoXiang0_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinBaoXiang0 = temp;
			temp.name = "skinBaoXiang0";
			temp.height = 60;
			var skin:StateSkin = new org.mokylin.skin.app.banghui.wangcheng.WangCheng_BaoXiang()
			temp.skin = skin
			temp.width = 154;
			temp.x = 19;
			temp.y = 19;
			return temp;
		}

		private function skinBaoXiang1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinBaoXiang1 = temp;
			temp.name = "skinBaoXiang1";
			temp.height = 60;
			var skin:StateSkin = new org.mokylin.skin.app.banghui.wangcheng.WangCheng_BaoXiang()
			temp.skin = skin
			temp.width = 154;
			temp.x = 32;
			temp.y = -1;
			return temp;
		}

		private function skinBaoXiang2_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinBaoXiang2 = temp;
			temp.name = "skinBaoXiang2";
			temp.height = 60;
			var skin:StateSkin = new org.mokylin.skin.app.banghui.wangcheng.WangCheng_BaoXiang()
			temp.skin = skin
			temp.width = 154;
			temp.x = 82;
			temp.y = -16;
			return temp;
		}

		private function skinBaoXiang3_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinBaoXiang3 = temp;
			temp.name = "skinBaoXiang3";
			temp.height = 60;
			var skin:StateSkin = new org.mokylin.skin.app.banghui.wangcheng.WangCheng_BaoXiang()
			temp.skin = skin
			temp.width = 154;
			temp.x = 401;
			temp.y = 87;
			return temp;
		}

		private function skinName1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinName1 = temp;
			temp.name = "skinName1";
			temp.height = 51;
			var skin:StateSkin = new org.mokylin.skin.app.banghui.wangcheng.ZhengBaVsNameItemSkin()
			temp.skin = skin
			temp.width = 187;
			temp.x = 0;
			temp.y = -11;
			return temp;
		}

		private function skinName2_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinName2 = temp;
			temp.name = "skinName2";
			temp.height = 50;
			var skin:StateSkin = new org.mokylin.skin.app.banghui.wangcheng.ZhengBaVsNameItemSkin()
			temp.skin = skin
			temp.width = 187;
			temp.x = 22;
			temp.y = -14;
			return temp;
		}

		private function skinName3_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinName3 = temp;
			temp.name = "skinName3";
			temp.height = 50;
			var skin:StateSkin = new org.mokylin.skin.app.banghui.wangcheng.ZhengBaVsNameItemSkin()
			temp.skin = skin
			temp.width = 187;
			temp.x = 0;
			temp.y = -7;
			return temp;
		}

		private function skinName_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinName = temp;
			temp.name = "skinName";
			temp.height = 49;
			var skin:StateSkin = new org.mokylin.skin.app.banghui.wangcheng.ZhengBaVsNameItemSkin()
			temp.skin = skin
			temp.width = 187;
			temp.x = 110;
			temp.y = 44;
			return temp;
		}

		private function uiCh1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiCh1 = temp;
			temp.name = "uiCh1";
			temp.styleName = "ui/app/banghui/wangcheng/weicheng4.png";
			temp.x = 42;
			temp.y = 36;
			return temp;
		}

		private function uiCh2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiCh2 = temp;
			temp.name = "uiCh2";
			temp.styleName = "ui/app/banghui/wangcheng/weicheng3.png";
			temp.x = 41;
			temp.y = 36;
			return temp;
		}

		private function uiCh3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiCh3 = temp;
			temp.name = "uiCh3";
			temp.styleName = "ui/app/banghui/wangcheng/weicheng1.png";
			temp.x = 43;
			temp.y = 36;
			return temp;
		}

		private function uiFlag1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiFlag1 = temp;
			temp.name = "uiFlag1";
			temp.styleName = "ui/app/banghui/wangcheng/kuaiji.png";
			temp.x = 74;
			temp.y = 103;
			return temp;
		}

		private function uiFlag2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiFlag2 = temp;
			temp.name = "uiFlag2";
			temp.styleName = "ui/app/banghui/wangcheng/qufu.png";
			temp.x = 78;
			temp.y = 107;
			return temp;
		}

		private function uiFlag3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiFlag3 = temp;
			temp.name = "uiFlag3";
			temp.styleName = "ui/app/banghui/wangcheng/gusu.png";
			temp.x = 74;
			temp.y = 106;
			return temp;
		}

		private function uiFlag_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiFlag = temp;
			temp.name = "uiFlag";
			temp.styleName = "ui/app/banghui/wangcheng/daliang.png";
			temp.x = 58;
			temp.y = 113;
			return temp;
		}

		private function uiWangCheng_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiWangCheng = temp;
			temp.name = "uiWangCheng";
			temp.styleName = "ui/app/banghui/wangcheng/wangcheng3.png";
			temp.x = 14;
			temp.y = 33;
			return temp;
		}

	}
}