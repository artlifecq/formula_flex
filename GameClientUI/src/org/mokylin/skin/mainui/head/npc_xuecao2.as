package org.mokylin.skin.mainui.head
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class npc_xuecao2 extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bar:feathers.controls.UIAsset;

		public var bg:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function npc_xuecao2()
		{
			super();
			
			this.currentState = "normal";
			this.height = 13;
			this.width = 155;
			this.elementsContent = [bg_i(),bar_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function bar_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bar = temp;
			temp.name = "bar";
			temp.height = 9;
			temp.styleName = "ui/mainui/head/duiyouxuetiao.png";
			temp.width = 153;
			temp.x = 1;
			temp.y = 1;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.left = 0;
			temp.right = 0;
			temp.styleName = "ui/mainui/head/duiyouxuetiao_di.png";
			temp.y = 0;
			return temp;
		}

	}
}