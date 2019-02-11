class ETL {
  transform(oldData) {
    return Object.entries(oldData).reduce((newData, [score, letters]) => {
      letters.forEach(letter => {
        newData[letter.toLowerCase()] = Number(score);
      });
      return newData;
    }, {});
  }
}

module.exports = ETL;
