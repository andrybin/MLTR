# MLTR - Multi-Leverage Trading Robot

MLTR is a sophisticated trading robot designed for automated backtesting and live trading on the Bybit exchange. It supports multiple trading strategies including MACross, VolProf, Random, and others, with advanced features like optimization, cross-validation, and multi-run capabilities.

## Features

- **Multiple Trading Strategies**: Supports various trading strategies including MACross, VolProf, Random, and more
- **Automated Backtesting**: Comprehensive backtesting framework with detailed performance metrics
- **Live Trading**: Real-time trading on Bybit exchange with demo mode support
- **Optimization**: Automated parameter optimization using cross-validation
- **Multi-run Support**: Execute multiple configurations simultaneously
- **Advanced Risk Management**: Dynamic stop-loss and take-profit mechanisms
- **Data Visualization**: Built-in visualization tools for performance analysis

## Architecture

```
MLTR/
├── backtesting/          # Backtesting framework and utilities
├── common/              # Common utilities and types
├── configs/             # Configuration files for different strategies
├── data_processing/     # Data loading and processing modules
├── deploy/              # Deployment scripts
├── experts/             # Trading expert implementations
├── indicators/          # Technical indicators
├── ml/                  # Machine learning components (if applicable)
├── trade/               # Trading execution modules
└── tools/               # Utility tools for ground truth generation and validation
```

## Installation

1. Clone the repository:
```bash
git clone https://github.com/andrybin/MLTR.git
cd MLTR
```

2. Set up virtual environment:
```bash
./deploy/setup_venv.sh
```

3. Install system dependencies (if needed):
```bash
sudo apt-get update
sudo apt-get install python3-pip
```

## Setup

### Environment Variables

Create a `.env` file in the root directory with required configuration:

```bash
# Log directory
LOG_DIR=./logs

# Logging level
LOGLEVEL=INFO

# Bybit API credentials (add to api.yaml)
BYBIT_API_KEY=your_api_key_here
BYBIT_API_SECRET=your_api_secret_here
```

### API Configuration

Create `api.yaml` file with your Bybit credentials:

```yaml
bybit_demo:
  api_key: "demo_api_key"
  api_secret: "demo_api_secret"

bybit_macross:
  api_key: "real_api_key"
  api_secret: "real_api_secret"

bot_token: "your_telegram_bot_token_here"
```

## Usage

### Running Backtests

```bash
python run.py backtest configs/macross/BTCUSDT.py
```

### Running Optimization

```bash
python run.py optimize configs/macross/BTCUSDT.py --run_backtests
```

### Live Trading (Demo Mode)

```bash
python run.py bybit configs/macross/BTCUSDT.py --demo
```

### Live Trading (Real Mode)

```bash
python run.py bybit configs/macross/BTCUSDT.py
```

### Cross-Validation

```bash
python run.py cross_validation configs/macross/BTCUSDT.py
```

### Multi-run

```bash
python run.py multirun configs/macross/BTCUSDT.py configs/random/BTCUSDT.py
```

## Configuration Files

Configuration files are located in the `configs/` directory and define:
- Trading strategy parameters
- Time period and symbol settings
- Risk management rules
- Wallet size and leverage
- Data handling options

Example configuration structure:
```python
updates = dict(
    symbol = Symbols.BTCUSDT,
    period=TimePeriod.M60,
    wallet=1000,
    volume_control = {"deposit_fraction": 0.5},
    leverage = 1,
    hist_size = 200,
    lot = 1,
    decision_maker = {
        "ma_fast_period": 40,
        "upper_levels": 0,
        "lower_levels": 1,
        "min_step": 0.9,
    },
    credentials="bybit_macross",
)
```

## Strategies

### MACross (Moving Average Cross)
- Uses moving average crossovers for entry signals
- Configurable fast period and level parameters

### VolProf (Volume Profile)
- Based on volume profile analysis
- Identifies support and resistance levels

### Random
- Random trading strategy for baseline comparison

### Others
- Additional strategies available in the experts/ directory

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For support, please open an issue on the GitHub repository or contact the maintainers.