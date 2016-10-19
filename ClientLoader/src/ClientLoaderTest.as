package
{
	import flash.display.Sprite;

	/**
	 *
	 * 客户端载入的入口测试
	 * @author Carver
	 * @modifier L.L.M.Sunny
	 * 修改时间：2016-3-31 上午10:15:32
	 *
	 */
	[SWF(width = "1600", height = "900", backgroundColor = "0x000000", frameRate = "60", quality = "LOW")]
	public class ClientLoaderTest extends Sprite
	{
		private var _client : ClientLoader;

		public function ClientLoaderTest()
		{
			_client = new ClientLoader();
			_client.baseDir = "http://168.168.44.130/wending/";
			_client.clientVersion = "161";
			_client.loaderVersion = "161";
			_client.isJson = false;
			addChild(_client);
		}
	}
}
