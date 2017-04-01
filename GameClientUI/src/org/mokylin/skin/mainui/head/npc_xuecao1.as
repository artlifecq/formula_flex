package org.mokylin.skin.mainui.head
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class npc_xuecao1 extends feathers.controls.StateSkin
	{

		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function npc_xuecao1()
		{
			super();
			
			this.currentState = "normal";
			this.height = 12;
			this.width = 8;
			this.elementsContent = [__npc_xuecao1_UIAsset1_i()];
			
			states = {
			};
			skinNames={};
		}


		private function __npc_xuecao1_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.left = 0;
			temp.right = 0;
			temp.styleName = "ui/mainui/head/npcxuetiao.png";
			temp.y = 0;
			return temp;
		}

	}
}