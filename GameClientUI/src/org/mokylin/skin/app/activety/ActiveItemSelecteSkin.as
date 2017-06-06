package org.mokylin.skin.app.activety
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ActiveItemSelecteSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var __ActiveItemSelecteSkin_UIAsset1:feathers.controls.UIAsset;

		public var __ActiveItemSelecteSkin_UIAsset2:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ActiveItemSelecteSkin()
		{
			super();
			
			this.currentState = "up";
			this.elementsContent = [];
			__ActiveItemSelecteSkin_UIAsset1_i();
			__ActiveItemSelecteSkin_UIAsset2_i();
			
			
			states = {
			};
			skinNames={"down":"ui/app/activety/zonghe/xuanzhong.png",
			"downAndSelected":"ui/app/activety/zonghe/xuanzhong.png",
			"hover":"ui/app/activety/zonghe/xuanzhong.png",
			"overAndSelected":"ui/app/activety/zonghe/xuanzhong.png",
			"up":"ui/common/hover/xuanqukuang2_alpha.png",
			"upAndSelected":"ui/app/activety/zonghe/xuanzhong.png"};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __ActiveItemSelecteSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__ActiveItemSelecteSkin_UIAsset1 = temp;
			temp.height = 71;
			temp.styleName = "ui/app/activety/zonghe/xuanzhong.png";
			temp.width = 585;
			return temp;
		}

		private function __ActiveItemSelecteSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__ActiveItemSelecteSkin_UIAsset2 = temp;
			temp.height = 71;
			temp.styleName = "ui/common/hover/xuanqukuang2_alpha.png";
			temp.width = 585;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}