package org.mokylin.skin.app.banghui.huangcheng
{
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_close3;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class HuangChengJiangLi extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnClose1:feathers.controls.Button;

		public var gid1_1:feathers.controls.UIAsset;

		public var gid1_6:feathers.controls.UIAsset;

		public var gid2_1:feathers.controls.UIAsset;

		public var gid3_1:feathers.controls.UIAsset;

		public var grpGrid1:feathers.controls.Group;

		public var grpGrid2:feathers.controls.Group;

		public var grpGrid3:feathers.controls.Group;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function HuangChengJiangLi()
		{
			super();
			
			this.currentState = "normal";
			this.height = 601;
			this.width = 956;
			this.elementsContent = [__HuangChengJiangLi_UIAsset2_i(),__HuangChengJiangLi_UIAsset3_i(),__HuangChengJiangLi_UIAsset4_i(),btnClose1_i(),__HuangChengJiangLi_UIAsset5_i(),__HuangChengJiangLi_UIAsset6_i(),__HuangChengJiangLi_UIAsset7_i(),__HuangChengJiangLi_UIAsset8_i(),__HuangChengJiangLi_UIAsset9_i(),__HuangChengJiangLi_UIAsset10_i(),grpGrid1_i(),grpGrid2_i(),grpGrid3_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __HuangChengJiangLi_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/wangcheng/bangzhongjiangli.png";
			temp.x = 660;
			temp.y = 161;
			return temp;
		}

		private function __HuangChengJiangLi_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/wangcheng/zhanlinghuangcheng.png";
			temp.x = 0;
			temp.y = 25;
			return temp;
		}

		private function __HuangChengJiangLi_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/wangcheng/xiaban.jpg";
			temp.x = 22;
			temp.y = 86;
			return temp;
		}

		private function __HuangChengJiangLi_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/banghui/wcjs_bg3.jpg";
			temp.x = 22;
			temp.y = 135;
			return temp;
		}

		private function __HuangChengJiangLi_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/wangcheng/title.png";
			temp.x = 356;
			temp.y = 92;
			return temp;
		}

		private function __HuangChengJiangLi_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/wangcheng/xiaodiandi.png";
			temp.x = 207;
			temp.y = 157;
			return temp;
		}

		private function __HuangChengJiangLi_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/wangcheng/guanyuanjiangli.png";
			temp.x = 241;
			temp.y = 162;
			return temp;
		}

		private function __HuangChengJiangLi_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/wangcheng/canyujiangli.png";
			temp.x = 29;
			temp.y = 531;
			return temp;
		}

		private function __HuangChengJiangLi_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/wangcheng/fuwuqijiangli.png";
			temp.x = 544;
			temp.y = 531;
			return temp;
		}

		private function __HuangChengJiangLi_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/wangcheng/xiaodiandi.png";
			temp.x = 629;
			temp.y = 157;
			return temp;
		}

		private function btnClose1_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose1 = temp;
			temp.name = "btnClose1";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_close3;
			temp.x = 906;
			temp.y = 98;
			return temp;
		}

		private function gid1_1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			gid1_1 = temp;
			temp.name = "gid1_1";
			temp.styleName = "ui/common/grid/normal/64.png";
			temp.x = 91;
			temp.y = 0;
			return temp;
		}

		private function gid1_6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			gid1_6 = temp;
			temp.name = "gid1_6";
			temp.styleName = "ui/common/grid/normal/64.png";
			temp.x = 509;
			temp.y = 0;
			return temp;
		}

		private function gid2_1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			gid2_1 = temp;
			temp.name = "gid2_1";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function gid3_1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			gid3_1 = temp;
			temp.name = "gid3_1";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function grpGrid1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpGrid1 = temp;
			temp.name = "grpGrid1";
			temp.x = 32;
			temp.y = 302;
			temp.elementsContent = [__HuangChengJiangLi_UIAsset11_i(),gid1_1_i(),gid1_6_i()];
			return temp;
		}

		private function grpGrid2_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpGrid2 = temp;
			temp.name = "grpGrid2";
			temp.x = 122;
			temp.y = 516;
			temp.elementsContent = [gid2_1_i()];
			return temp;
		}

		private function grpGrid3_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpGrid3 = temp;
			temp.name = "grpGrid3";
			temp.x = 656;
			temp.y = 516;
			temp.elementsContent = [gid3_1_i()];
			return temp;
		}

	}
}