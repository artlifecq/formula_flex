package org.mokylin.skin.common.over
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class SelectBtn extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var __SelectBtn_UIAsset1:feathers.controls.UIAsset;

		public var __SelectBtn_UIAsset2:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function SelectBtn()
		{
			super();
			
			this.currentState = "upAndSelected";
			this.height = 24;
			this.width = 242;
			this.elementsContent = [];
			__SelectBtn_UIAsset1_i();
			__SelectBtn_UIAsset2_i();
			
			
			states = {
			};
			skinNames={"down":"ui/common/hover/xuanqukuang2.png",
			"downAndSelected":"ui/common/hover/xuanqukuang2.png",
			"hover":"ui/common/hover/xuanqukuang2.png",
			"overAndSelected":"ui/common/hover/xuanqukuang2.png",
			"up":"ui/common/hover/xuanqukuang2_alpha.png",
			"upAndSelected":"ui/common/hover/xuanqukuang2.png"};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __SelectBtn_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__SelectBtn_UIAsset1 = temp;
			temp.bottom = 0;
			temp.left = 0;
			temp.right = 0;
			temp.styleName = "ui/common/hover/xuanqukuang2.png";
			temp.top = 0;
			return temp;
		}

		private function __SelectBtn_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__SelectBtn_UIAsset2 = temp;
			temp.bottom = 0;
			temp.left = 0;
			temp.right = 0;
			temp.styleName = "ui/common/hover/xuanqukuang2_alpha.png";
			temp.top = 0;
			return temp;
		}

	}
}